struct DeepOptional {
    s1: String?;
    s2: String?;
    flag: Bool;
}

struct Wrapper {
    d: DeepOptional;
    note: String?;
}

contract DeepOptionals {
    deep: Wrapper;

    init() {
        self.deep = Wrapper{
            d: DeepOptional{
                s1: "some",
                s2: null,
                flag: true
            },
            note: null
        };
    }
}