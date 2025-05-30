struct NestedOpt {
    f1: Int?;
    f2: Bool?;
    f3: String;
}

struct Upper {
    nest: NestedOpt;
    val: Int;
}

contract OptInStruct {
    u: Upper;

    init() {
        self.u = Upper{
            nest: NestedOpt{ f1: null, f2: true, f3: "ok" },
            val: 123
        };
    }
}
