struct SWithString {
    a: String = "hello";
}

struct Container {
    s: SWithString;
    b: Bool = false;
}

contract NestedStringDefault {
    v: Container;
    init() {
        self.v = Container{
            s: SWithString{},
            b: false
        };
    }
}