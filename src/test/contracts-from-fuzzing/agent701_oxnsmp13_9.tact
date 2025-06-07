struct InnerSub {
    flag: Bool;
    text: String;
}

struct MiddleSub {
    x: Int;
    inner: InnerSub;
}

struct Root {
    arr1: MiddleSub;
    arr2: MiddleSub;
    flag: Bool;
}

contract WideNestedOptional {
    root: Root?;

    init() {
        self.root = null;
    }
}