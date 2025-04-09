struct Test1 {
    a: Int;
}

struct Test2 {
    b: Test1;
}

struct Test3 {
    c: Test2;
}

struct Test4 {
    d: Test3;
}

contract FourDeep {
    val: Test4;

    init() {
        self.val = Test4{ d: Test3{ c: Test2{ b: Test1{ a: 7 } } } };
    }
}