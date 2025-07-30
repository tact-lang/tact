struct Inner1 { a: Int; b: String; }
struct Inner2 { c: Bool; d: Int?; }

struct Bigger {
    i1: Inner1;
    i2: Inner2;
    s: String?;
}

contract StructMix {
    s: Bigger;
    init() {
        self.s = Bigger{
            i1: Inner1{a:1, b:"b"},
            i2: Inner2{c:true, d:null},
            s: null
        };
    }
}