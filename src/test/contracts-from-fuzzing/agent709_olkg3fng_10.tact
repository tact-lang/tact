struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: Inner;
    label: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: null,
                b: null
            },
            label: "label"
        };
    }
}