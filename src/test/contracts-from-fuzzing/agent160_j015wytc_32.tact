struct Inner1 {
    x: Int?;
    y: Bool;
}

struct Inner2 {
    z: String = "hi";
}

struct Outer {
    i1: Inner1?;
    i2: Inner2;
    n: Int = 123;
}

contract CombineOptionsDefaults {
    f: Outer;
    init() {
        self.f = Outer{
            i1: null,
            i2: Inner2{},
        };
    }
}