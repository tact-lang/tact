struct A {
    sub1: SubA;
    sub2: SubB;
}

struct SubA {
    foo: Int;
    bar: Bool;
    baz: String;
}

struct SubB {
    alpha: Int;
    beta: Bool?;
    gamma: Slice;
}

contract ComplexNested {
    field: A;

    init() {
        self.field = A{
            sub1: SubA{
                foo: 1,
                bar: true,
                baz: "hi"
            },
            sub2: SubB{
                alpha: 2,
                beta: null,
                gamma: emptyCell().asSlice()
            }
        };
    }
}