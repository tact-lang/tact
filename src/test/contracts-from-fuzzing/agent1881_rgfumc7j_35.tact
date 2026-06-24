struct A {
    s: String;
    i: Int;
}

contract DefaultsMix {
    a: A = A{s:"zero",i:0};

    init() {
        self.a = A{s:"one",i:1};
    }
}