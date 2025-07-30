struct A {
    val: Int;
}

struct B {
    val: A;
}

struct C {
    val: B;
}

struct D {
    val: C;
}

contract FourNestStruct {
    deepField: D;
    init() {
        self.deepField = D{ val: C{ val: B{ val: A{ val: 777 } } } };
    }
}