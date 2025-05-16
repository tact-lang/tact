struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    flag: Bool?;
}

struct Outer {
    m: Middle;
    count: Int;
    done: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            m: Middle{
                inner: Inner{
                    a: 5,
                    b: true,
                },
                flag: null,
            },
            count: 10,
            done: false,
        };
    }
}