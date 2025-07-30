struct Sub {
    x: Int;
    y: Bool?;
    z: String;
}

struct Mid {
    a: Int;
    sub1: Sub;
    sub2: Sub;
}

contract NestedMany {
    state: Mid;

    init() {
        self.state = Mid{
            a: 100,
            sub1: Sub{
                x: 1,
                y: null,
                z: "one"
            },
            sub2: Sub{
                x: 2,
                y: true,
                z: "two"
            }
        };
    }
}