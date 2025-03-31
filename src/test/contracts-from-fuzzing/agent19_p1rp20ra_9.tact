contract TestNullDump {
    receive() {
         dump(null);
    }
}
