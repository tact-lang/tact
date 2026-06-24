// nested optionals inside structs
struct S {
    a: Int?;
    b: Bool?;
}

struct Outer {
    s: S?;
}

contract TestContract {
    d: Outer;

    init() {
        self.d = Outer{ s: null };
    }
}