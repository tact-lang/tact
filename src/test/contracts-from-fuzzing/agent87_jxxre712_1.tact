contract TestString {
    receive() {
        let test: String = "Hello, Tact!";
        emit(test.asComment());
    }
}