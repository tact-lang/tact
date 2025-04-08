struct NestedOptionalsStruct {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: String?;
}

contract NestedOptionals {
    data: NestedOptionalsStruct;

    init() {
        self.data = NestedOptionalsStruct{
            a: null,
            b: Inner{x: 7, y: null}
        };
    }
}
