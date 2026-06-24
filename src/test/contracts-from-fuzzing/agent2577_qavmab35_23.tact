struct SimplyOptional {
    a: Int?;
    b: Bool?;
}

contract NestedOptionAssign {
    var: SimplyOptional;

    init() {
        self.var = SimplyOptional{ a:null, b:null };
    }
}
