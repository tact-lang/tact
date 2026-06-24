contract ManyNestedFields {
    f1: A;
    f2: B;
    f3: C;
    f4: D;

    init() {
        self.f1 = A{inner: "aaa"};
        self.f2 = B{data: InnerB{val: 42}};
        self.f3 = C{sub: SubC{flag: true, text: "hi"}};
        self.f4 = D{
            pair: Pair{first: 1, second: 2}
        };
    }
}

struct A {
    inner: String;
}

struct B {
    data: InnerB;
}

struct InnerB {
    val: Int;
}

struct C {
    sub: SubC;
}

struct SubC {
    flag: Bool;
    text: String;
}

struct D {
    pair: Pair;
}

struct Pair {
    first: Int;
    second: Int;
}
