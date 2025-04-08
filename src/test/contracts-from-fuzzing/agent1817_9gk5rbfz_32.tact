// deep highly heterogenous nested optional + default mix
struct A { a: Int?; }
struct B { a: A = A{a:null}; b: Int = 5; }
struct C { b: B?; c: Bool = true; }

contract OptDefaultMix {
    s: C;

    init() {
        self.s = C{ b: null, c: false };
    }
}