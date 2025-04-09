struct A {
    i: Int;
}

struct B {
    a: A;
    flag: Bool;
}

struct C {
    b: B;
    text: String;
}

contract WideNested {
    c: C;

    init() {
        self.c = C{b: B{a: A{i:42}, flag:true}, text:"test"};
    }
}