struct DeeplyOptional {
    one: Int?;
    two: Bool?;
    three: String?;
    four: DeepOpt?;
}

struct DeepOpt {
    inn: Int?;
}

contract OptInOpt {
    val: DeeplyOptional;
    init() {
        self.val = DeeplyOptional{
            one: 1,
            two: false,
            three: "hi",
            four: DeepOpt{ inn: 5 }
        };
    }
}