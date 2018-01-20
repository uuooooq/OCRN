
import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NativeModules,
  Button
} from 'react-native';

var nativeMethods = NativeModules.NativeMethodsCall;

const requireNativeComponent = require('requireNativeComponent');

class RNHighScores extends React.Component {
  

  btnPress(){
    nativeMethods.addEvent('Birthday Party', '4 Privet Drive, Surrey');
  }

  render() {
    var contents = this.props["scores"].map(
      score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
    );
    var FlexibleSizeExampleView = requireNativeComponent('FlexibleSizeExampleView');
    return (
      
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>
          2048 High Scores!
        </Text>
        <Text style={styles.scores}>    
          {contents}
        </Text>
        <Button 
          onPress={this.btnPress.bind(this)}
          title="call native methods"
          color="blue"
          accessibilityLabel="Learn more about this purple button"
        />
        <View style={styles.nativeViewBG}/>
                <FlexibleSizeExampleView style={styles.nativeView}>
      </FlexibleSizeExampleView>
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
    //height: 700,
    //width: 600,
    //backgroundColor: '#333333',
    //flex:1
    position:'absolute',
    top: 0,
    bottom:0,
    left:0,
    right:0,
    backgroundColor:'black',
    opacity:0.5
  },
  nativeView: {
    //height: 700,
    //width: 600,
    //backgroundColor: '#333333',
    //flex:1
    position:'absolute',
    top: 0,
    bottom:0,
    left:0,
    right:0
  }
});

// 整体js模块的名称
AppRegistry.registerComponent('OCRN', () => RNHighScores);
