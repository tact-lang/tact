struct Inner {
    optFlag: Bool?;
    label: String;
}

struct Outer {
    count: Int;
    nestedOpt: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            count: 123,
            nestedOpt: null,
        };
    }
}