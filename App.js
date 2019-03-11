import React, {Component} from 'react'
import { 
  Image, 
  StyleSheet,
  View,
  NativeModules,
  Text
} from 'react-native'

const DLNativeModule = NativeModules.DLNativeModule

export default class App extends Component {
  state = {
    imagePathWithExtension: '',
    imagePathNoExtension: ''
  }

  componentDidMount() {
    DLNativeModule.getLocalImagePath((imagePathNoExtension, imagePathWithExtension) => {
      console.log('imagePathNoEx', imagePathWithExtension, imagePathNoExtension);
      
      this.setState({
        imagePathNoExtension,
        imagePathWithExtension
      })
    })
  }

  render() {
    const { imagePathWithExtension, imagePathNoExtension } = this.state
    return (
      <View style={styles.container}>
        <Text style={styles.title}>Image Path with extension name works</Text>
        <Image style={styles.image} source={{ uri: imagePathWithExtension }} />
        <Text style={styles.title}>Image Path no extension name doesn't render</Text>
        <Image style={styles.image} source={{ uri: imagePathNoExtension }} />
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  image: {
    width: 200,
    height: 200,
    backgroundColor: '#ccc',
    marginTop: 8
  },
  title: {
    fontSize: 16,
    color: '#333',
    marginTop: 20
  }
})
