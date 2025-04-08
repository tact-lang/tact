struct NestedStruct {
    s: Second;
}

struct Second {
    t: Third;
}

struct Third {
    num: Int;
    txt: String;
    b: Bool;
    addr: Address;
    cell: Cell;
    slice: Slice;
}

contract MultiNested {
    st: NestedStruct = NestedStruct {
        s: Second {
            t: Third {
                num: 42, txt: "hi", b: true,
                addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
                cell: cell("te6cckEBAQEAAgAAAEysuc0="),
                slice: slice("te6cckEBAQEAAgAAAEysuc0=")
            }
        }
    };

    init() {}
}
