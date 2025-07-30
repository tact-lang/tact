// Optional struct nested inside struct
struct Inner {
    a: Int;
}

struct Outer {
    inn: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{ inn: null };
    }
}