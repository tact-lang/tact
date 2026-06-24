struct Inner1 {
    f: Int;
}
struct Inner2 {
    f: String;
}
struct Middle {
    a: Inner1;
    b: Inner2;
}
struct Top {
    m: Middle;
}

contract ComplexNested {
    storage: Top;

    init() {
        self.storage = Top{ m: Middle{ a: Inner1{f:1}, b: Inner2{f:"str"} } };
    }
}