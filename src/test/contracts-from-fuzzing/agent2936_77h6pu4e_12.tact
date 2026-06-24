struct Inner1 {
    x: Int;
}

struct Inner2 {
    a: Inner1;
}

struct Inner3 {
    b: Inner2;
}

struct Container {
    a: Int;
    b: Inner3;
    c: String;
    d: Bool;
    e: Int?;
}

contract Test {
    storage: Container;

    init() {
        self.storage = Container{
            a: 7,
            b: Inner3{b: Inner2{a: Inner1{x: 100}}},
            c: "xyz",
            d: false,
            e: null
        };
    }
}