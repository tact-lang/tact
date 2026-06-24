contract TestVoidDump {
    receive() {
         dump(emit("msg".asComment()));
    }
}
