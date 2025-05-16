struct DeeplyOptional {
    flag: Bool?;
    num: Int?;
    text: String?;
}

contract OptStructFields {
    val: DeeplyOptional;

    init() {
        self.val = DeeplyOptional{
            flag: null,
            num: null,
            text: null
        };
    }
}
