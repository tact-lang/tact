struct Inner {
    importantValue: Int;
}

struct Outer {
    optionalInner: Inner?;
    label: String;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            optionalInner: null,
            label: "Uninitialized nested optional"
        };
    }
}