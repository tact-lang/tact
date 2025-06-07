struct DeepOptional {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    nested: DeepOptional?;
}

contract OptStructStruct {
    val: OuterOpt?;

    init() {
        self.val = OuterOpt{
            nested: DeepOptional{
                x: -1,
                y: false
            }
        };
    }
}