struct A {
    foo: Int;
    bar: Int?;
}

struct B {
    id: Int;
    a: A?;
}

struct C {
    label: String;
    b: B;
}

contract ThreeDeepNested {
    data: C;

    init() {
        self.data = C{
            label: "deep",
            b: B{
                id: 1,
                a: A{foo:10, bar:null}
            }
        };
    }
}