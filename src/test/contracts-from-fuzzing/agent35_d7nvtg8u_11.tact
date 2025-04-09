struct A { x: Int }
struct B { y: Bool }
struct C { z: String }

struct Wrapper {
    a: A;
    b: B;
    c: C;
    optA: A?;
    optB: B?;
    optC: C?;
}

contract ComboOptions {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            a: A{x:1},
            b: B{y:true},
            c: C{z:"zzz"},
            optA: null,
            optB: null,
            optC: null
        };
    }
}