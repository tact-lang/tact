struct InnerDeep {
    a: Int;
    b: Int?;
}

struct Middle {
    inner: InnerDeep;
    flag: Bool;
}

struct Outer {
    nested: Middle;
    text: String;
}

contract DeepOptionalTest {
    data: Outer?;

    init() {
        self.data = Outer{
            nested: Middle{
                inner: InnerDeep{
                    a: 5,
                    b: null
                },
                flag: true
            },
            text: "abc"
        };
    }
}
