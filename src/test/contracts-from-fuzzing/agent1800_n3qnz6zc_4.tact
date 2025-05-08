struct Inner {
    innerInt: Int;
    innerBool: Bool;
    innerString: String;
}

struct Middle {
    middleInt: Int;
    middleInner: Inner;
}

struct Outer {
    outerInt: Int;
    outerMiddle: Middle;
}

contract DeepStructStorage {
    data: Outer;

    init() {
        self.data = Outer{
            outerInt: 10,
            outerMiddle: Middle{
                middleInt: 20,
                middleInner: Inner{
                    innerInt: 30,
                    innerBool: false,
                    innerString: "hello"
                }
            }
        };
    }
}