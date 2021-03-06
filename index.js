
import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NativeModules,
  Button,
  TouchableOpacity
} from 'react-native';

var nativeMethods = NativeModules.NativeMethodsCall;
var viewMethods = NativeModules.FlexibleSizeExampleViewCall;

import Video from 'react-native-video';

let mp4video = require('./test.mp4');


const requireNativeComponent = require('requireNativeComponent');
var FlexibleSizeExampleView = requireNativeComponent('FlexibleSizeExampleView');

class RNHighScores extends React.Component {
constructor(props) {
  super(props);
  
  this.state ={
    rate: 1,
    volume: 1,
    muted: false,
    resizeMode: 'contain',
    duration: 0.0,
    currentTime: 0.0,
    controls: false,
    paused: false,
    skin: 'custom',
    ignoreSilentSwitch: null,
    isBuffering: false,
    showVideo:false,
    showImagesAnimation:false
};
}



  btnPress(){
    //nativeMethods.addEvent('Birthday Party', '4 Privet Drive, Surrey');
    this.setState({
      showImagesAnimation:true
    });
    viewMethods.addEvent1('Birthday Party', '4 Privet Drive, Surrey');
  }

  // btnPress3(){
  //   nativeMethods.addEvent('Birthday Party', '4 Privet Drive, Surrey');
  // }

  btnPress1(){
    this.setState({
      showVideo:true
    });
    this.player.seek(0);
  }

  actonPlay(){
    this.setState({
      showVideo:true,
      showImagesAnimation:false
    });
    //this.player.seek(0);
  }

  videoClick(){
    this.setState({
      showVideo:false
    });
  }

  videoEnd(){
    this.setState({
      showVideo:false
    });
  }

  render() {
    var contents = this.props["scores"].map(
      score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
    );
    
    
    //let videoView = this.state.showVideo ?  : null;
    let videoView = null;
    if(this.state.showVideo){
      
      videoView = (
      <Video
        source={mp4video}
        style={styles.fullScreen}
        ref={(ref) => {
        this.player = ref
        }}
        onEnd={this.videoEnd.bind(this)}
        />
        );
    }

    let imageAnimationView = null;
    if(this.state.showImagesAnimation){

      imageAnimationView = (
        <TouchableOpacity onPress={this.actonPlay.bind(this)} >
        <FlexibleSizeExampleView style={styles.nativeView}>
        </FlexibleSizeExampleView>
        </TouchableOpacity>
      );
    }

    let bgView = null;
    if(this.state.showImagesAnimation || this.state.showVideo){

      bgView = (
        <View style={styles.nativeViewBG}/>
      );
    }

    return (
      
      <View style={styles.container}>
        {/* <Text style={styles.highScoresTitle}>
          2048 High Scores!
        </Text>
        <Text style={styles.scores}>    
          {contents}
        </Text> */}
        <View style={{marginTop:100}} />
        <Text style={styles.highScoresTitle}>这是帧动画演示</Text>
        <Button 
          onPress={this.btnPress.bind(this)}
          title="显示"
          color="blue"
          accessibilityLabel="Learn more about this purple button"
        />
        {bgView}
        {imageAnimationView}
        {videoView}
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    //justifyContent: 'center',
    //alignItems: 'center',
    backgroundColor: '#FFFFFF',
    flexDirection: 'column',
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  // container: {
  //   flex: 1,
  //   backgroundColor: '#F5FCFF',
  // },
  text: {
    marginBottom: 20
  },
  nativeViewBG: {
    position:'absolute',
    top: 0,
    bottom:0,
    left:0,
    right:0,
    backgroundColor:'black',
    opacity:0.5
  },
  nativeView: {
    position:'absolute',
    top: 0,
    bottom:0,
    left:0,
    right:0
  },
  backgroundVideo: {
    position: 'absolute',
    top: 0,
    left: 0,
    bottom: 0,
    right: 0,
  },
  fullScreen: {
    position: 'absolute',
    top: 0,
    left: 0,
    bottom: 0,
    right: 0,
}
});

// 整体js模块的名称
AppRegistry.registerComponent('OCRN', () => RNHighScores);
