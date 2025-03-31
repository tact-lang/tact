contract TestStringDump {
    receive() {
        dump("Hello, Tact debug!");
    }
}
