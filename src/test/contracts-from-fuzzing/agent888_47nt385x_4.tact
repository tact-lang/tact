struct Inner {
    flag: Bool?;
    num: Int;
}

struct Outer {
    inner: Inner?;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{inner: null, text: "test"};
    }
}