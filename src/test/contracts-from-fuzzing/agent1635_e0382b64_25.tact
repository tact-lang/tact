// Struct with deeply nested primitives and optionals
struct A { x: Int; y: Int?; }
struct B { a: A; b: Bool?; }
struct C { b: B; s: String; }

contract NestedCombo {
    val: C;

    init() {
        self.val = C{
            b: B{
                a: A{x:42,y:null},
                b:true
            },
            s: "hi"
        };
    }
}