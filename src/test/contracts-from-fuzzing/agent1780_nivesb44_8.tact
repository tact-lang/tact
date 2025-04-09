struct DeepOptional {
    x: Int?;
    y: Bool?;
    s: InnerOptional?;
}

struct InnerOptional {
    flag: Bool?;
    content: String?;
}

contract NestedOptionals {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            x:null, y:null, s:null
        };
    }
}