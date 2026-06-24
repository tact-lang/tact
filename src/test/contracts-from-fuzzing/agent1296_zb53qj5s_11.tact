struct SOptional {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

struct NestedSO {
    part: SOptional;
    more: Int;
}

contract MultiOptionals {
    data: NestedSO;
    init() {
        self.data = NestedSO{
            part: SOptional{
                optInt:null,optBool:null,optString:null
            },
            more: 123
        };
    }
}