struct Params {
    name: String = "X";
    flag: Bool?;
    count: Int?;
}

struct Outer {
    inner: Params;
    value: Int;
}

contract NestedOptionDefaults {
    o: Outer;

    init() {
        self.o = Outer{
            inner: Params{
                flag: null,
                count: null,
            },
            value: 5,
        };
    }
}