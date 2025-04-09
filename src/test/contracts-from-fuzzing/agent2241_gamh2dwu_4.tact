struct InnerMost {
    a: Int = 1;
}

struct Inner {
    aa: Int = 2;
    bb: Bool = true;
    cc: InnerMost;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    intVal: Int = 3;
    boolVal: Bool = false;
    addressVal: Address;
}

contract NestedStructs {
    state: Outer;

    init() {
        self.state = Outer{
            inner1: Inner{
                aa: 10,
                bb: true,
                cc: InnerMost{ a: 17 }
            },
            inner2: Inner{
                aa: 12,
                bb: false,
                cc: InnerMost{ a: -9 }
            },
            intVal: 777,
            boolVal: true,
            addressVal: myAddress()
        };
    }
}