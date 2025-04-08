struct A {
    x: Int;
    y: Bool?;
}

struct B {
    a: A;
    z: Int;
}

struct Outer {
    inner: B;
    flag: Bool;
    text: String;
}

contract MultiNested {
    state: Outer;

    init() {
        self.state = Outer{
            inner: B{
                a: A{
                    x: 1,
                    y: null,
                },
                z: 2,
            },
            flag: true,
            text: "Hello",
        };
    }
}