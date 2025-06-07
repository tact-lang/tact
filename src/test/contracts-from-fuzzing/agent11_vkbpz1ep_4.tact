struct InnerMost {
    x: Int;
    y: Int;
}

struct Middle {
    inner: InnerMost?;
    label: String;
}

struct Wrapper {
    mid: Middle;
    flag: Bool;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            mid: Middle{ inner: null, label: "test" },
            flag: false
        };
    }
}