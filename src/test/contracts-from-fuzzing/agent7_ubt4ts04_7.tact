contract Playground {
    receive("plays") {
        // Test dumping an optional Int: initialize as null, then assign a value
        let opt: Int? = null;
        opt = 42;
        dump(opt);
    }
}
