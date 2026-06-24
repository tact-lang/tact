struct Inner {
    i: Int = 10;
    flag: Bool = true;
}

struct Outer {
    label: String = "def";
    inner: Inner = Inner{};
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            label: "hi",
            inner: Inner{i:33, flag:false},
        };
    }
}