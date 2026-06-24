contract LiteralExprTest {
    receive() {
        let a: Int = 42;
        let b: Bool = true;
        let s: String = "Tact";
        let addr: Address = myAddress();
    }
}
