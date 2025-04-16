struct NestedOpt {
    s: OptStruct;
    flag: Bool;
}

struct OptStruct {
    val: Int?;
    note: String?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            s: OptStruct{ val:null, note:null },
            flag: true
        };
    }
}
