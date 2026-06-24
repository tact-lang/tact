struct ComplexNested {
    a: Int;
    b: MidLevel;
    c: Bool;
}

struct MidLevel {
    x: Int;
    y: LowLevel;
    z: String?;
}

struct LowLevel {
    p: Bool;
    q: Address;
    r: Cell;
}

contract CpxNested {
    data: ComplexNested;
    init() {
        self.data = ComplexNested{
            a: 42,
            b: MidLevel{
                x: 7,
                y: LowLevel{
                    p: true,
                    q: myAddress(),
                    r: emptyCell()
                },
                z: null
            },
            c: false
        };
    }
}