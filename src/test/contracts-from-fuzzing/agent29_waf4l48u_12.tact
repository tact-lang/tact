struct A { f: Int; }
struct B { g: Bool; }
struct C { h: Address; }

struct Nested {
    aa: A;
    bb: B;
    cc: C;
    optionalA: A?;
    optionalB: B?;
    optionalC: C?;
}

contract Combo {
    nested: Nested;
    init() {
        self.nested = Nested{
            aa: A{f:1},
            bb: B{g:true},
            cc: C{h: myAddress()},
            optionalA: null,
            optionalB: null,
            optionalC: null
        };
    }
}
