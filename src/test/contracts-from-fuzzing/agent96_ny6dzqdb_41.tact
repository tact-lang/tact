// Edge: long string default in field
contract Test {
    msg: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit";

    init() {
        self.msg = "shorter";
    }
}