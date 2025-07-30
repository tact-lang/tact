struct A1 { a: Int }
struct A2 { a: Int }

struct B1 { x: Int }
struct B2 { y: Bool }

struct BigMix {
    a1: A1;
    a2: A2;
    b1: B1;
    b2: B2;
    optional1: Int?;
    optional2: Bool?;
}

contract Test17 {
    d: BigMix;

    init() {
        self.d = BigMix{
            a1: A1{a:5},
            a2: A2{a:6},
            b1: B1{x:7},
            b2: B2{y:true},
            optional1: null,
            optional2: false
        };
    }
}
