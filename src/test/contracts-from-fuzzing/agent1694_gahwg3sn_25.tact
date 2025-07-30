struct DeepNested {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
}

struct WrapperNested {
    nested: DeepNested;
}

contract DeepDeep {
    elem: WrapperNested;

    init() {
        self.elem = WrapperNested{
            nested: DeepNested{
                a: 1,
                b: null,
                c: true,
                d: null,
                e: "x",
                f: null,
                g: emptyCell(),
                h: null,
                i: emptyCell().asSlice(),
                j: null,
                k: myAddress(),
                l: null
            }
        };
    }
}