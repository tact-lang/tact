// Contract with a struct containing many nested optional structs
struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    x: InnerOpt?;
    y: InnerOpt?;
    z: InnerOpt?;
}

contract NestedOptionChains {
    field: OuterOpt = OuterOpt{ x: null, y: null, z: null };
    init() {
        self.field.x = InnerOpt{ a: 1, b: true };
        self.field.y = null;
        self.field.z = InnerOpt{ a: null, b: null };
    }
}