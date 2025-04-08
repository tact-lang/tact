struct InnerMost {
    inner: Int;
    optional: Bool?;
}
struct Middle {
    first: InnerMost;
    second: InnerMost;
}
struct OuterMost {
    layer: Middle;
    info: String;
}

contract MultiNestedStructs {
    state: OuterMost;
    init() {
        self.state = OuterMost{
            layer: Middle{
                first: InnerMost{inner: 1, optional:null},
                second: InnerMost{inner:2, optional:true}
            },
            info: "test"
        };
    }
}
