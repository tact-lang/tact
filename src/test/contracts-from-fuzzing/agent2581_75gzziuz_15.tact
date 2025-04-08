struct ABool {
    a: Bool;
}

struct COpt {
    val: ABool?;
}

contract NestedOptionalStruct2 {
    x: COpt;

    init() {
        self.x = COpt{ val: null };
    }
}
