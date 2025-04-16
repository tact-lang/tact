struct A { val1: Int; val2: Bool?; }
struct B { valA: A; valB: A; }
contract NestedStructs {
    storage: B;

    init() {
        self.storage = B{
            valA: A{ val1: 1, val2: null },
            valB: A{ val1: 2, val2: true },
        };
    }
}