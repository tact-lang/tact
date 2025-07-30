struct S {
    a: A;
    b: B;
}

struct A {
    n: Int;
    m: M;
}

struct M {
    flag: Bool;
    text: String;
}

struct B {
    val: Int;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a: A{ n:1, m: M{ flag:true, text: "hi" } },
            b: B{ val:2 }
        };
    }
}
