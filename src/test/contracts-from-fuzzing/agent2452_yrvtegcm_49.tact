struct ABool {
    flag: Bool;
}

struct AOpt {
    inner: ABool?;
}

contract NestedOptionalStruct {
    data: AOpt? = null;
    init() {
        self.data = null;
    }
}