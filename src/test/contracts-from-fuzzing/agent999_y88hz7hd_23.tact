struct EmptyStringTest {
    s: String = "";
}

contract EmptyStringInStruct {
    val: EmptyStringTest;

    init() {
        self.val = EmptyStringTest{
            s: ""
        };
    }
}