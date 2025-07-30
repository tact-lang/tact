struct B {
    val: Int = 123;
    flag: Bool = false;
}

struct A {
    inner: B;
    text: String;
}

contract DefaultsPropagation {
    data: A;

    init() {
        self.data = A{
            inner: B{},    // should use both inner defaults
            text: "abc"
        };
    }
}
