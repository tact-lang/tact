struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct Combo {
    x: A;
    y: B;
}

contract MultiNested {
    val: Combo;
    init() {
        self.val = Combo{ x: A{a:1}, y: B{b:2} };
    }
}