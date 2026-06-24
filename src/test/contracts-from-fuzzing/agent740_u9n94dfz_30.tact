struct NestedOptionStruct {
    x: Int;
    y: InnerStruct?;
}

struct InnerStruct {
    z: Bool;
}

contract NestedOptionContract {
    s: NestedOptionStruct;
    init() {
        self.s = NestedOptionStruct{
            x:5,
            y:null,
        };
    }
}