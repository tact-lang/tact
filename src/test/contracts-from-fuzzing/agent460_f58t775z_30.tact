struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainOpt {
    x: OptStruct?;
}

contract NestedOptStruct {
    field: ContainOpt = ContainOpt{ x: null };
    init() {
        self.field = ContainOpt{
            x: OptStruct{ a:1, b:true, c:"hi" }
        };
    }
}
