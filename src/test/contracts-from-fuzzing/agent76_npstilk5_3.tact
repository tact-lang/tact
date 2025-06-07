struct Deep {
    foo: Int;
    bar: String;
    optField: Bool?;
}

struct Outer {
    innerField: Deep;
    optionalInner: Deep?;
}

contract DeepOptionalContract {
    record: Outer;
    
    init() {
        self.record = Outer{
            innerField: Deep{
                foo: 1,
                bar: "innermost",
                optField: true,
            },
            optionalInner: null,
        };
    }
}