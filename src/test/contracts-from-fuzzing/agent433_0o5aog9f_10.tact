struct OptionStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct NestedOptionStruct {
    inner: OptionStruct?;
}

contract TestContract {
    nestedOpt: NestedOptionStruct;

    init() {
        self.nestedOpt = NestedOptionStruct{
            inner: null,
        };
    }
}