struct EmptyStringsTest {
    s1: String;
    s2: String;
}

contract ContractStrings {
    data: EmptyStringsTest;

    init() {
        self.data = EmptyStringsTest{
            s1: "",
            s2: "hello"
        };
    }
}
