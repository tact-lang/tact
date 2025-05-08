struct EmptyStringTest {
    s: String;
}

contract StrEmpty {
    val: EmptyStringTest;

    init() {
        self.val = EmptyStringTest{
            s: ""
        };
    }
}