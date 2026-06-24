contract NestedOptionField {
    data: Outer;

    init() {
        self.data = Outer{
            val: 1,
            nestedOpt: Inner{
                deepVal: 2
            }
        };
    }
}

struct Outer {
    val: Int;
    nestedOpt: Inner?;
}

struct Inner {
    deepVal: Int;
}
