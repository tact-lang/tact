struct ReorderTest {
    a: Int;
    b: Bool;
    c: String;
}

contract FieldOrderChange {
    state: ReorderTest;

    init() {
        self.state = ReorderTest {
            b: true,
            a: 42,
            c: "hi"
        };
    }
    
    receive() {
        let _ = self.state.a;
    }
}