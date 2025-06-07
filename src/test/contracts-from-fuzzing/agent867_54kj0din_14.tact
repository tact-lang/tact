// optional struct with nested optional primitive
struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s: S? = null;

    init() {
        self.s = S{
            a: 5,
            b: true,
            c: "xyz"
        };
    }
}
