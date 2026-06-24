struct NestedOpt {
    x: Int?;
    sub: SubOptStruct;
}

struct SubOptStruct {
    flag: Bool?;
    note: String?;
}

contract MultiOpt {
    info: NestedOpt;

    init() {
        self.info = NestedOpt{
            x: null,
            sub: SubOptStruct{flag: null, note: null}
        };
    }
}