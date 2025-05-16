struct WithBool {
    b: Bool;
}

contract OptionalVsSet {
    opt: Int?;
    fix: Int;
    str: String?;
    s: WithBool;

    init() {
        self.opt=null;
        self.fix=7;
        self.str="hi";
        self.s=WithBool{b:true};
    }
}