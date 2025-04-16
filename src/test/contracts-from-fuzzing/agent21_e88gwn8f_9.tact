contract TestVoidDump {
    fun f() {
        // returns void implicitly
    }

    receive() {
        dump(self.f());
    }
}
