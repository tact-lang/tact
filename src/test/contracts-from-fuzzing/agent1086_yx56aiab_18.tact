struct MultiNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Int;
    y: Inner2;
}

struct Inner2 {
    z: Int;
}

contract DeepContract {
    state: MultiNested;

    init() {
        self.state = MultiNested{
            a: 1,
            b: Inner1{
                x: 2,
                y: Inner2{ z: 3 }
            },
            c: Inner2{ z: 4 }
        };
    }
}