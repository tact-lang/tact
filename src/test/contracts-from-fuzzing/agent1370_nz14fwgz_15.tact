struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct Container {
    one: Inner1;
    two: Inner2;
    x: Int;
    y: String;
}

contract CombinedStructs {
    data: Container;

    init() {
        self.data = Container{
            one: Inner1{a: 5},
            two: Inner2{b: true},
            x: 10,
            y: "hi"
        };
    }
}