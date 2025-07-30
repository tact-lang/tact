struct InnerOptional {
    innerVal: Int?;
    flag: Bool;
}

struct OuterOptional {
    nested: InnerOptional?;
    outerVal: Int;
}

contract TestContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nested: InnerOptional{
                innerVal: null,
                flag: true
            },
            outerVal: 101
        };
    }
}