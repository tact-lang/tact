struct DeeplyOptional {
    nested: OptionalInner?;
}

struct OptionalInner {
    flag: Bool;
    message: String;
}

contract OptionalNest {
    data: DeeplyOptional;
    
    init() {
        self.data = DeeplyOptional{
            nested: OptionalInner{
                flag: true,
                message: "xyz"
            }
        };
    }
}