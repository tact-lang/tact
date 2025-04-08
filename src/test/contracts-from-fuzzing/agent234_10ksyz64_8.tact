struct NestedOptionals {
    a: Int?;
    b: InnerOptStruct?;
}

struct InnerOptStruct {
    x: Int?;
    y: Bool?;
}

contract NestedOptionContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: InnerOptStruct{ x: null, y: true }
        };
    }
}