struct A {
    flag: Bool;
    value: Int;
}

struct B {
    nested: A?;
    text: String;
}

struct C {
    part: B;
    extra: String?;
}

contract Test {
    data: C;
    init() {
        self.data = C{
            part: B{
                nested: A{
                    flag: true,
                    value: 1234
                },
                text: "nested"
            },
            extra: null
        };
    }
}