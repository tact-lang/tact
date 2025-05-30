struct InnerA {
    x: Int;
}
struct InnerB {
    y: Bool;
    z: InnerA;
}

struct InnerC {
    a: String?;
    b: InnerB;
}

contract NestedStructs {
    persist: InnerC;

    init() {
        self.persist = InnerC{
            a: null,
            b: InnerB{
                y: true,
                z: InnerA{ x: 11 }
            }
        };
    }
}