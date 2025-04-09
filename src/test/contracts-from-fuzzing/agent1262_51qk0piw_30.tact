struct A {
    a: Int;
}

struct B {
    b: A;
}

contract DefaultStruct {
    f: B = B{b: A{a:1}};
}