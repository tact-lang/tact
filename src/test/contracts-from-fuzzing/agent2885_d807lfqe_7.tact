struct A {
    x: Int;
    b: Bool;
}

struct B {
    a: A;
    y: String;
}

struct C {
    z: Int;
    b: B;
}

contract OptionalDeepStruct {
    deepOpt: C?;

    init() {
        self.deepOpt = null;
    }
}