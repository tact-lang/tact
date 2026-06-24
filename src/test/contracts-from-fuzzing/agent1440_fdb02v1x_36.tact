contract NestedContractOpt {
    i: Int = 1;
    optSub: SubStruct? = null;

    init() {
        self.optSub = SubStruct{ s: "abc", b: true };
    }
}

struct SubStruct {
    s: String;
    b: Bool;
}