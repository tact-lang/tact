struct A {
    val: Int;
}

struct B {
    val: Int;
}

struct C {
    a: A;
    b: B;
}

contract SimilarSubstructs {
    val: C;

    init() {
        self.val = C{
            a: A{ val: 1 },
            b: B{ val: 2 }
        };
    }
}