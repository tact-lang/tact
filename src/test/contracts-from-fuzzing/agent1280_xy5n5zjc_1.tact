struct Inner {
    val1: Int;
    val2: Bool;
}

struct Holder {
    nested: Inner;
    optional: Int?;
}

contract NestedStructStorage {
    data: Holder;
    
    init() {
        self.data = Holder{
            nested: Inner{
                val1: 1,
                val2: true,
            },
            optional: null,
        };
    }
}