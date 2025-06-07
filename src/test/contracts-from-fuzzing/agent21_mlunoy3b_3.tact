contract TestContract {
    receive() {
        // Testing literal expressions: integer, boolean, string, and address using valid constants
        let intLit: Int = 123;
        let boolLit: Bool = true;
        let strLit: String = "hello";
        let addrLit: Address = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        
        return;
    }
}
