struct A { x: Int; }
struct B { y: Int; }
struct C {
    optA: A?;
    optB: B?;
}

contract OptionalMulti {
    data: C;
    init() {
        self.data = C{ optA:null, optB:null };
    }
}