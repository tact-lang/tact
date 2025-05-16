struct Blend {
    flag: Bool;
    num: Int;
    maybe: String?;
    txt: String;
}

contract MixTypes {
    val: Blend;

    init() {
        self.val = Blend{
            flag: true,
            num: 123,
            maybe: null,
            txt: "ok",
        };
    }
}
