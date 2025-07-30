struct A {
    aa: Int;
    ab: Bool;
}

struct B {
    ba: String;
    bb: A;
}

struct C {
    ca: Int;
    cb: String?;
    cc: B;
}

contract ManyNestedFields {
    f1: A;
    f2: B;
    f3: C;
    f4: C?;
    flag: Bool;
    number: Int;

    init() {
        self.f1 = A{aa: 1, ab: false};
        self.f2 = B{ba: "b", bb: self.f1};
        self.f3 = C{ca: 3, cb: null, cc: self.f2};
        self.f4 = null;
        self.flag = true;
        self.number = 42;
    }
}
