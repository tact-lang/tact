struct Inner {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Wrapper {
    inner: Inner?;
    flag: Bool;
    number: Int;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: null,
            flag: true,
            number: 7
        };
    }
}