struct Inner {
    one: Int;
    two: Bool;
    three: String;
}

struct Outer {
    a: Int;
    nested: Inner;
    flag: Bool;
    msg: String;
}

contract PersistOuter {
    state: Outer;

    init() {
        self.state = Outer{
            a: 5,
            nested: Inner{
                one: 1,
                two: true,
                three: "nested"
            },
            flag: false,
            msg: "outer"
        };
    }
}