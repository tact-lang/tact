struct Inner1 { a: Int; b: Int?; }
struct Inner2 { c: Int; d: Int?; }

struct Nest {
    i1: Inner1;
    i2: Inner2;
}

contract TestContract {
    nest: Nest;

    init() {
        self.nest = Nest{
            i1: Inner1{a:1,b:null},
            i2: Inner2{c:2,d:null},
        };
    }
}
