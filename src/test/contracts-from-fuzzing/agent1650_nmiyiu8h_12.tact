struct X {
    a: Int;
}

struct Y {
    x: X;
}

struct Z {
    y: Y;
}

contract OptionalDeepStruct {
    info: Z?;

    init() {
        self.info = null;
    }
}