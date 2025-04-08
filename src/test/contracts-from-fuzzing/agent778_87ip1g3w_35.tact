struct DeepOptStr {
    val: String?;
}

struct Container {
    inner: DeepOptStr;
    flag: Bool;
}

contract NestedOptString {
    data: Container;
    init() {
        self.data = Container{
            inner: DeepOptStr{ val: null },
            flag: true
        };
    }
}