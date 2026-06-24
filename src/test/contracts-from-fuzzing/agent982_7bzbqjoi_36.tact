struct Combo {
    i: Int;
    b: Bool;
    s: String;
    ia: Int?;
    sa: String?;
    ba: Bool?;
}

struct WrappedStruct {
    base: Combo;
    label: String;
}

contract WrappedNested {
    data: WrappedStruct;

    init() {
        self.data = WrappedStruct{
            base: Combo{
                i:4, b:false, s:"ok", ia:null, sa:null, ba:null
            },
            label: "test"
        };
    }
}