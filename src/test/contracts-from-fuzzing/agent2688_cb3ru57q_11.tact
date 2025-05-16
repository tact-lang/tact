struct EmptyStringTest {
    s: String;
}

contract Test {
    data: EmptyStringTest;

    init() {
        self.data = EmptyStringTest{
            s: ""
        };
    }
}