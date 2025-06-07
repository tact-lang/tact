struct A {
    f1: Int?;
}

struct B {
    f2: A?;
}

struct C {
    f3: B?;
}

contract MultiOpt {
    val: C;

    init() {
        self.val = C{f3: B{f2: A{f1: 10}}};
    }
}
