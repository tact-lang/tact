struct Layer1 {
    i: Int;
    s: String?;
}

struct Layer2 {
    l1: Layer1;
    b: Bool;
}

struct Layer3 {
    l2: Layer2;
    c: Cell;
}

struct Layer4 {
    l3: Layer3;
    addr: Address?;
}

contract FourLayerDeep {
    complex: Layer4;
    init() {
        self.complex = Layer4{
            l3: Layer3{
                l2: Layer2{
                    l1: Layer1{ i: 11, s: null },
                    b: true
                },
                c: emptyCell()
            },
            addr: null
        };
    }
}