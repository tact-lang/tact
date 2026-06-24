struct Inner1 {
    a: Int;
}

struct Inner2 {
    a: Int;
    b: Bool?;
    c: String;
}

struct Container {
    s1: Inner1;
    s2: Inner2;
    num: Int;
    flag: Bool;
}

contract StructMix {
    st: Container;

    init() {
        self.st = Container{
            s1: Inner1{ a: 7 },
            s2: Inner2{ a: 8, b: true, c: "world" },
            num: 9,
            flag: true,
        };
    }
}