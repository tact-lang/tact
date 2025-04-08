struct Deep {
    field1: Int;
    field2: Bool?;
}

struct Middle {
    deepStruct: Deep;
    num: Int;
}

contract DeepNestContract {
    info: Middle;

    init() {
        self.info = Middle{
            deepStruct: Deep{
                field1: 777,
                field2: null,
            },
            num: 123,
        };
    }
}