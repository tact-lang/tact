contract Test {
    receive() {
        // Dumping an optional with a non-null value
        let opt1: Int? = 42;
        dump(opt1);
        
        // Dumping an optional with a null value
        let opt2: Int? = null;
        dump(opt2);
    }
}
