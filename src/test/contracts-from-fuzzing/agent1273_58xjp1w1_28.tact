struct A {
    val: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
    a5: A;
}

contract BunchNestedStructs {
    big: B;

    init() {
        self.big = B{a1:A{val:1}, a2:A{val:2}, a3:A{val:3}, a4:A{val:4}, a5:A{val:5}};
    }
}