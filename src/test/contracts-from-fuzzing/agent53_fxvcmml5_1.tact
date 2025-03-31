contract TestString { 
    receive() {
        let testStr: String = "Hello, World!";
        dump(testStr);
    }
}