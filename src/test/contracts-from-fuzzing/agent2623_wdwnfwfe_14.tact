struct Middle {
    one: Int;
    two: Int;
}

struct Wrapper {
    inner: Middle;
    flag: Bool;
    message: String;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: Middle{one: 123, two: 456},
            flag: false,
            message: "string here",
        };
    }
}