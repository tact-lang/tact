contract TestVoidDump {
    receive("debug") {
        dump(emit("msg".asComment()));
    }
}
