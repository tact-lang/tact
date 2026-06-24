struct Ab {
    x: Int;
    y: Bool;
}

struct Cd {
    s: String;
    optInt: Int?;
}

struct Complex {
    first: Ab;
    second: Cd;
    third: Ab;
    fourth: Cd;
}

contract FieldsMix {
    foo: Complex;

    init() {
        self.foo = Complex{
            first: Ab{ x:1, y:true },
            second: Cd{ s:"abc", optInt:null },
            third: Ab{ x:2, y:false },
            fourth: Cd{ s:"def", optInt:5 }
        };
    }
}