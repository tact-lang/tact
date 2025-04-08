// deeply nested with various nullable fields
struct A { a: Int }
struct B { b: Int?; a: A }
struct C { c: B?; b: B }
struct D { d: C; c: C? }

contract DeepNullableMix {
    root: D;

    init() {
        self.root = D{
            d:C{c:null,b:B{b:null,a:A{a:1}}},
            c:null
        };
    }
}