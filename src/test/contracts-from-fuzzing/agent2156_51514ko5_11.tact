struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Container {
    x: Inner1;
    y: Inner2?;
}

contract MixedNested {
    data: Container;
    init() {
        self.data = Container{
            x: Inner1{a: 11},
            y: null
        };
    }
}