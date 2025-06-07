// Struct with explicit serialization formats and nested optional
struct S {
    a: Int as int8;
    b: Int? as uint8;
    c: String;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{ a: -128, b: null, c: "hi" };
    }
}