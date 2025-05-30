struct Nested {
    flag: Bool = false;
    count: Int = 0;
}

struct Outer {
    nested: Nested;
    message: String = "hello";
    optionalInt: Int?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            nested: Nested{flag: true, count: 42},
            message: "hi",
            optionalInt: null,
        };
    }
}
