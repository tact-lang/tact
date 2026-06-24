struct Inner {
    x: Int;
    y: Bool = true;
    note: String?;
}

contract NestedTest {
    coord: Inner;

    init() {
        self.coord = Inner{
            x: 5,
            y: false,
            note: "hello"
        };
    }

    receive() {
        let _ = self.coord.x;
    }
}