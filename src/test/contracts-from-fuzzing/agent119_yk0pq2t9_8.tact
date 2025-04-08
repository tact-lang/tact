struct Inner {
    x: Int = 1;
    y: Bool?;
    z: String = "hi";
}

struct Outer {
    inner: Inner;
    flag: Bool = false;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                x: 100,
                y: null,
                z: "yo"
            },
            flag: true
        };
    }
}