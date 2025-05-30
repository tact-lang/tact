struct Inner {
    flag: Bool;
    number: Int;
}

struct Middle {
    innerStruct: Inner;
    txt: String;
}

contract TestContract {
    outerField: Middle;

    init() {
        self.outerField = Middle{
            innerStruct: Inner{
                flag: true,
                number: 42
            },
            txt: "hello"
        };
    }
}