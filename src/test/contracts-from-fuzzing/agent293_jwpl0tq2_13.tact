struct Complex {
    inn1: Inner1;
    inn2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Int;
}

struct Inner2 {
    flag: Bool;
    s: String;
}

contract ComplexStorage {
    val: Complex;

    init() {
        self.val = Complex{
            inn1: Inner1{x: 11, y: 22},
            inn2: Inner2{flag: true, s: "s"}
        };
    }
}