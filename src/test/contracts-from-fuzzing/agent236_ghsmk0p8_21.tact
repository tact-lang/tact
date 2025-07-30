struct Inner {
    flag1: Bool?;
    flag2: Bool?;
    info: String;
    number: Int;
}

struct Outer {
    status: Bool?;
    inner: Inner?;
    label: String;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            status: null,
            inner: null,
            label: "" 
        };
    }
}