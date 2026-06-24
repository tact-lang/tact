struct Sub {
    txt: String;
    flag: Bool?;
}

contract NestedOptStrBool {
    s: Sub;

    init() {
        self.s = Sub {
            txt: "hello",
            flag: null
        };
    }
}