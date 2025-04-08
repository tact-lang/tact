struct Nested {
    a: Int;
    b: Bool;
    opt_c: String?;
}

contract TestContract {
    point: Nested;

    init() {
        self.point = Nested{
            a: 5,
            b: true,
            opt_c: "hello",
        };
    }
}