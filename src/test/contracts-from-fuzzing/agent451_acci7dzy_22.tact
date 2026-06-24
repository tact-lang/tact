struct Complex {
    nested1: Nested;
    nested2: NestedOptional;
}

struct Nested {
    a: Int;
    b: Bool;
}

struct NestedOptional {
    a: Int?;
    b: Bool?;
}

contract ComplexContract {
    data: Complex;

    init() {
        self.data = Complex{
            nested1: Nested{a:1,b:true},
            nested2: NestedOptional{a:null,b:null}
        };
    }
}