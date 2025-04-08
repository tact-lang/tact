struct Inner {
    ni: Int = 7;
    nb: Bool?; 
}

struct Outer {
    oi: Int = 42;
    os: String = "hello";
    inner: Inner;
}

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            oi: 5,
            os: "world",
            inner: Inner{ ni: 1, nb: true }
        };
    }
}
