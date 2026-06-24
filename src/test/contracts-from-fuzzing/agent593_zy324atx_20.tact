// Since slices cannot be const-initialized, make that field optional and init in constructor
struct Inner {
    id: Int = 0;
    flag: Bool = false;
    txt: String = "";
}

struct Outer {
    s: Inner;
    addr: Address?;
    sl: Slice?;
    opt: Int?;
}

contract NestedAssignment2 {
    field: Outer = Outer{
        s: Inner{ id: 10, flag: false, txt: "" },
        addr: null,
        sl: null,
        opt: null,
    };

    init() {
        self.field.addr = myAddress();
        self.field.sl = emptyCell().asSlice();
        self.field.opt = 42;
    }
}