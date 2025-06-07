// omit optional struct fields during init assignment
struct S {
    a: Int?;
    b: Bool?;
}

contract C {
    s: S;
    init() {
        self.s = S{};
    }
}