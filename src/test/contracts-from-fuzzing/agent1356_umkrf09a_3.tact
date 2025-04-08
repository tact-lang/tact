struct OptStruct {
    val: Int?;
    txt: String?;
    addr: Address?;
    nested: NestedOpt?;
}

struct NestedOpt {
    b: Bool;
    c: Cell;
}

contract OptTest {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            val: null,
            txt: null,
            addr: null,
            nested: null,
        };
    }
}
