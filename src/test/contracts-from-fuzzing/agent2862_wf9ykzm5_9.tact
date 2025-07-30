struct InnerDeep {
    innerVal: Int;
    innerFlag: Bool?;
}

struct Middle {
    midInt: Int;
    nestedInner: InnerDeep;
}

struct Outer {
    message: String;
    nestedMiddle: Middle;
}

contract DeepNest {
    deepObj: Outer = Outer{
        message: "abc",
        nestedMiddle: Middle{
            midInt: 7,
            nestedInner: InnerDeep{
                innerVal: 1,
                innerFlag: null,
            },
        },
    };
}