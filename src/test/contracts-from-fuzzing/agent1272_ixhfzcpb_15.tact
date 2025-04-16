struct A {
    intVal: Int;
}

struct B {
    intVal: Int;
}

struct C {
    a: A;
    b: B;
    intVal: Int;
}

contract SimilarNames {
    record: C;
    init() {
        self.record = C{
            a: A{intVal: 1},
            b: B{intVal: 2},
            intVal: 3
        };
    }
}
