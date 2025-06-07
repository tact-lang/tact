struct A {
    i: Int;
    next: B?;
}

struct B {
    flag: Bool;
    deep: C?;
}

struct C {
    text: String;
}

contract LongChain {
    root: A?;

    init() {
        self.root = A{
            i: 10,
            next: B{
                flag: true,
                deep: C{
                    text: "deeply nested chain",
                },
            },
        };
    }
}