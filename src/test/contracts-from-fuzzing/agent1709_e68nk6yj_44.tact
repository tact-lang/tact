// Struct with trailing optional nested struct
struct T {
    v: Int;
}

struct Outer {
    a: Int;
    b: T?;
}

contract TrailingOptionalStruct {
    d: Outer;
    init() {
        self.d = Outer{
            a: 7,
            b: null,
        };
    }
}