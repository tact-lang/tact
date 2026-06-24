struct BigTuple {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
}

contract TupleTest {
    state: BigTuple;

    init() {
        self.state = BigTuple{
            i1: 10,
            i2: 20,
            i3: 30,
            i4: 40,
            b1: true,
            b2: false,
            s1: "hello",
            s2: "world"
        };
    }
}