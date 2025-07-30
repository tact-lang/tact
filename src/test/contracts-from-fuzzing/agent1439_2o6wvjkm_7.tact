struct InnerOption {
    a: Int?;
    b: Int?;
}

struct OuterOption {
    inner: InnerOption?;
    value: Int;
}

contract NestedOptionFields {
    x: OuterOption;

    init() {
        self.x = OuterOption{
            inner: InnerOption{a:null,b:2},
            value: 3
        };
    }
}