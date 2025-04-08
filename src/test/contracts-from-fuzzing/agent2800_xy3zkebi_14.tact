struct Param1 {
    x: Int;
}

struct Param2 {
    s: String;
}

struct Complex {
    one: Param1;
    two: Param2;
    opt: Param1?;
}

contract Test {
    f: Complex;

    init() {
        self.f = Complex{
            one: Param1{x:1},
            two: Param2{s:"s"},
            opt: null
        };
    }
}