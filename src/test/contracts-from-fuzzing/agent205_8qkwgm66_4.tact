struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: String;
}

struct Combined {
    a: Inner1;
    b: Inner2;
    optionalInt: Int?;
    optionalBool: Bool?;
}

contract MultiOptionalNested {
    data: Combined;

    init() {
        self.data = Combined{
            a: Inner1{ x: 1 },
            b: Inner2{ y: "test" },
            optionalInt: null,
            optionalBool: true
        };
    }
}