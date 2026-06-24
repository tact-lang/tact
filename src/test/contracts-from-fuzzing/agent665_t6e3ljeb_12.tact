struct Outer {
    sub1: Sub1;
    sub2: Sub2;
}

struct Sub1 {
    intVal: Int;
}

struct Sub2 {
    subsub: SubSub;
}

struct SubSub {
    boolVal: Bool;
}

contract TestMultiLevel {
    data: Outer;

    init() {
        self.data = Outer{
            sub1: Sub1{ intVal: 1 },
            sub2: Sub2{ subsub: SubSub{ boolVal: true } }
        };
    }
}
