struct ContainsStr {
    s: String;
    i: Int;
}

contract StrStructTest {
    item: ContainsStr;

    init() {
        self.item = ContainsStr{ s: "test string", i: 42 };
    }
}