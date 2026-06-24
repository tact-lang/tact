struct StringsStruct {
    a: String = "alpha";
    b: String = "beta";
    c: String = "gamma";
    d: String = "delta";
}

contract MultiStringTest {
    val: StringsStruct = StringsStruct{};

    receive() {
        let _ = self.val.c;
    }
}