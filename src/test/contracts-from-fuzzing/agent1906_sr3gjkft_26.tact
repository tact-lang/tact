// struct with optional with default value null omitted
struct S {
    a: Int?;
}

contract ImpliedNull {
    x: S;

    init() {
        self.x = S{};
    }
}
