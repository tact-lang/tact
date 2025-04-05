contract TestOptionalValid {
    receive() {
        // Optional variable initially null, then assigned
        let opt: Int? = null;
        opt = 100;
        dump(opt!!); // should dump 100
    }
}
