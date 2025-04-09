struct C {
    done: Bool;
}

struct B {
    count: Int;
    inner: C;
}

struct A {
    label: String;
    nested: B;
}

contract OptionalDeepNested {
    data: A?;

    init() {
        self.data = A{
            label: "opt deep",
            nested: B{
                count: 100,
                inner: C{
                    done: true,
                },
            },
        };
    }
}
