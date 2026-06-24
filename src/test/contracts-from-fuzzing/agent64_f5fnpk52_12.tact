struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct T {
    x: S;
    y: S?;
}

contract StructOptionalStruct {
    value: T;

    init() {
        self.value = T{
            x: S{
                a: 1,
                b: true,
                c: "x",
                d: null,
                e: null,
                f: null
            },
            y: null
        };
    }

    receive() {
        self.value.y = self.value.x;
    }
}