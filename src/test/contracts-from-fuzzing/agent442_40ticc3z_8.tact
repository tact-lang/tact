struct EmptyStringTest {
    a: String;
    b: String = "";
}

contract TestContract {
    val: EmptyStringTest;

    init() {
        self.val = EmptyStringTest{
            a: "",
            b: ""
        };
    }
}
