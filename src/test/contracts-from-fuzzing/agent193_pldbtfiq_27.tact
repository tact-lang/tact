struct WithStr {
    s: String;
}

struct WithBool {
    b: Bool;
}

contract Mix {
    st: WithStr;
    bl: WithBool;

    init() {
        self.st=WithStr{s:"foo"}; self.bl=WithBool{b:false};
    }
}