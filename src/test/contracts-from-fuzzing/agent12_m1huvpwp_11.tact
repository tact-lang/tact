struct Inner {
    a: Int?;
    b: String?;
}

struct Outer {
    innerOpt: Inner?;
    label: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: null,
            label: "hello"
        };
    }
}