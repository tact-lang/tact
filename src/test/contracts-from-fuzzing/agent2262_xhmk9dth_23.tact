struct C {
    x: String?;
    y: Int?;
}

struct B {
    foo: Int;
    bar: C?;
}

struct A {
    p: B?;
    q: Bool;
}

contract Test {
    val: A;

    init() {
        self.val = A{
            q: false
            // omit p entirely
        };
    }
}