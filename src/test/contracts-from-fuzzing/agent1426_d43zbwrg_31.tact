struct IntBoolStr {
    i: Int;
    b: Bool;
    s: String;
}

struct Container {
    inner: IntBoolStr;
    flag: Bool;
}

contract QualifiedTypes {
    data: Container;

    init() {
        self.data = Container{
            inner: IntBoolStr{ i:7, b:false, s:"hi" },
            flag: true
        };
    }
}