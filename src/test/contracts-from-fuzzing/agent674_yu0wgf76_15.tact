struct HasString {
    msg: String;
}

struct ContainsStr {
    s1: HasString;
    s2: HasString;
}

contract TestContract {
    data: ContainsStr;

    init() {
        self.data = ContainsStr{
            s1: HasString{ msg: "Hello" },
            s2: HasString{ msg: "World" },
        };
    }
}