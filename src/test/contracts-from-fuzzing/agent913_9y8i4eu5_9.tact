struct EmptyStringTest {
    s: String;
}

contract TestContract {
    data: EmptyStringTest;
    init() {
        self.data = EmptyStringTest{
            s: ""
        };
    }
}