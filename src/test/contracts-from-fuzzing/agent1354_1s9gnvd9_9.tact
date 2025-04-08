struct Inner1 { foo: Int; bar: Bool; }
struct Inner2 { baz: String; qux: Int; }

struct MultiInner {
    i1: Inner1;
    i2: Inner2;
    count: Int;
    label: String;
}

contract TestContract {
    storage: MultiInner;

    init() {
        self.storage = MultiInner{
            i1: Inner1{ foo: 1, bar: true },
            i2: Inner2{ baz: "hello", qux: 2 },
            count: 3,
            label: "world"
        };
    }
}