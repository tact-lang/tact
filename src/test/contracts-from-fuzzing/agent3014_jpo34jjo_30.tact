// Complex nested struct, combining optionals, primitives, strings
struct Sub {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Container {
    s1: Sub;
    s2: Sub?;
}

contract ComplexNested {
    d: Container;
    init() {
        self.d = Container{
            s1: Sub{ a:null, b:true, c:null },
            s2: null
        };
    }
}