struct A { intA: Int; }
struct B { intB: Int; optA: A?; }
struct C { intC: Int; optB: B?; }
struct D { intD: Int; optC: C?; }
struct E { intE: Int; optD: D?; }

contract TestContract {
    deepOpt: E;

    init() {
        self.deepOpt = E{
            intE: 5,
            optD: null
        };
    }
}