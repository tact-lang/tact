struct DeepOne {
    f1: Int;
    f2: Int?;
    f3: String;
}

struct DeepTwo {
    ff1: DeepOne;
    ff2: String;
}

struct DeepThree {
    fff1: DeepTwo;
    fff2: Bool;
}

contract NestedThree {
    deep: DeepThree;

    init() {
        self.deep = DeepThree{
            fff1: DeepTwo{
                ff1: DeepOne{
                    f1: 1,
                    f2: null,
                    f3: "hello"
                },
                ff2: "again"
            },
            fff2: true
        };
    }
}