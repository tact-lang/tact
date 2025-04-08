struct Inner {
    val: Int;
    flag: Bool;
    nestedOpt: DeepInside?;
}

struct DeepInside {
    something: Int;
    word: String;
}

contract OptInNest {
    data: Inner;

    init() {
        self.data = Inner{
            val: 5,
            flag: true,
            nestedOpt: DeepInside{
                something: 9,
                word: "hi",
            },
        };
    }
}