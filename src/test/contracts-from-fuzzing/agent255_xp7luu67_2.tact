struct DeepNested {
    n: Nested;
    flag: Bool;
}

struct Nested {
    num: Int;
    sOpt: String?;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            n: Nested{
                num: 5,
                sOpt: null,
            },
            flag: false
        };
    }
}