struct WithStr {
    a: Int;
    b: String;
}

contract StrField {
    s: WithStr;

    init() {
        self.s = WithStr{a:10,b:"xyz"};
    }
}