struct JustBool {
    b: Bool;
}

struct NestedJustBoolOpt {
    jb: JustBool?;
}

contract NestedBoolOpt {
    f: NestedJustBoolOpt;
    init() {
        self.f = NestedJustBoolOpt{ jb: null };
    }
}