struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
    str: String;
}

contract NestedFieldsContract {
    container: Inner;

    init() {
        self.container = Inner{
            nested: InnerMost{ val: 777 },
            str: "deep"
        };
    }
}