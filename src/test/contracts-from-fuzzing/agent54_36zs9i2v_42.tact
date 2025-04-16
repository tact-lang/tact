// Complex nested with optionals and default values
struct A { x: Int? = null; }
struct B { a: A; y: Bool = false; }
struct C { b: B; z: Int; }

contract ComplexOptDefaults {
    data: C;
    init() {
        self.data = C{
            b: B{
                a: A{ x:null },
                y:true
            },
            z:77
        };
    }
}