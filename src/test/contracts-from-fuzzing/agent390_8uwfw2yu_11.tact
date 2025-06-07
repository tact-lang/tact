struct NestedStringBool {
    s: String;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    optNum: Int?;
}

contract NestedStringsBools {
    field: NestedStringBool;

    init() {
        self.field = NestedStringBool{
            s:"hi",
            inner: Inner{ flag:true, optNum:null }
        };
    }
}