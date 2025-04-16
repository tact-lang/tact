struct InnerMost {
    x: Int;
    y: Bool;
    z: Address;
}

struct MidLevel {
    a: InnerMost;
    b: InnerMost;
}

struct TopLevel {
    first: MidLevel;
    second: MidLevel;
}

contract TestContract {
    nested: TopLevel;

    init() {
        self.nested = TopLevel {
            first: MidLevel {
                a: InnerMost { x:1, y:true, z: myAddress() },
                b: InnerMost { x:2, y:false, z: myAddress() }
            },
            second: MidLevel {
                a: InnerMost { x:3, y:true, z: myAddress() },
                b: InnerMost { x:4, y:false, z: myAddress() }
            }
        };
    }
}
