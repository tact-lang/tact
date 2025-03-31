contract TestOptionalDump {
    receive() {
        let a: Int? = 42;
        dump(a); // Dumping an optional integer (Some)
        let b: Int? = null;
        dump(b); // Dumping a null optional
    }
}
