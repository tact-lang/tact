struct WithBool {
    flag: Bool;
    num: Int;
}

contract BoolFirst {
    prop: WithBool;
    init() {
        self.prop = WithBool { flag: true, num: 42 };
    }
}