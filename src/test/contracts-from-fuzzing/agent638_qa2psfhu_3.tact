struct Inner {
    x: Int = 1;
    flag: Bool = false;
    comment: String?; // default null
}

struct Outer {
    inner: Inner;
    payload: Cell?; // default null
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 42,
                flag: true,
                comment: "hi"
            },
            payload: emptyCell()
        };
    }

    receive() {}
}