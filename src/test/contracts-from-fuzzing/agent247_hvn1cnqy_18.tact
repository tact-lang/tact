struct Inner1 {
    foo: Int;
}

struct Inner2 {
    bar: Inner1;
}

struct OuterMost {
    inner: Inner2;
    name: String;
}

contract NestedStructs {
    store: OuterMost;

    init() {
        self.store = OuterMost{
            inner: Inner2{bar: Inner1{foo: 55}},
            name: "test"
        };
    }
}