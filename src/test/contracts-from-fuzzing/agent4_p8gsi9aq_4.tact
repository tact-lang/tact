contract TestLiteral {
    receive() {
        let intVal: Int = 42;
        let boolVal: Bool = true;
        let strVal: String = "Hello";
        let addrVal: Address = myAddress();
    }
}
