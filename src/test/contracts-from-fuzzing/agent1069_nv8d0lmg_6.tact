struct Inner {
    amount: Int;
    description: String;
}

struct Middle {
    innerStruct: Inner;
    count: Int?;
}

struct Outer {
    middleStruct: Middle;
    isActive: Bool;
}

contract DeepOptional {
    data: Outer;

    init() {
        self.data = Outer{
            middleStruct: Middle{
                innerStruct: Inner{amount: 5, description: "abc"},
                count: null
            },
            isActive: false
        };
    }
}