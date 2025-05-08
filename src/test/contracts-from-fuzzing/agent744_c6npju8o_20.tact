struct SDeep {
    x: Int;
    y: Sub1;
}

struct Sub1 {
    z: Sub2;
}

struct Sub2 {
    addr: Address;
    cellRef: Cell;
    sliceRef: Slice;
}

contract ComplexNested {
    val: SDeep;

    init() {
        self.val = SDeep{
            x: 1,
            y: Sub1{
                z: Sub2{
                    addr: myAddress(),
                    cellRef: emptyCell(),
                    sliceRef: emptyCell().asSlice(),
                },
            },
        };
    }
}