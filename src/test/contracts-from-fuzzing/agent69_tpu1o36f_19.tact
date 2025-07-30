struct MixOpt {
    num: Int;
    flag: Bool?;
    word: String;
}

contract NestedMixOpt {
    val: MixOpt;

    init() {
        self.val = MixOpt{
            num: 44,
            flag: null,
            word: "hello"
        };
    }
}