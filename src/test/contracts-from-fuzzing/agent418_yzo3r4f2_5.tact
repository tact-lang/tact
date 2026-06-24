struct Mid1 {
    a: Int;
    b: Bool;
}

struct Mid2 {
    x: String;
    y: Bool?;
}

struct Container {
    m1: Mid1;
    m2: Mid2;
    flag: Bool;
    label: String;
}

contract Combo {
    state: Container = Container{
        m1: Mid1{ a: 1, b: true },
        m2: Mid2{ x: "foo", y: null },
        flag: false,
        label: "bar"
    };

    receive() {
        self.state = Container{
            m1: Mid1{ a: 5, b: false },
            m2: Mid2{ x: "baz", y: true },
            flag: true,
            label: "done"
        };
    }
}