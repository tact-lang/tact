struct Inner {
    txt: String = "hello";
    flag: Bool = false;
}

struct Outer {
    inner: Inner;
    number: Int = 5;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{},
            number: 10
        };
    }
}