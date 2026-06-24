struct MixedOptionals {
    requiredFlag: Bool;
    optionalFlag: Bool?;
    requiredNum: Int;
    optionalNum: Int?;
    requiredText: String;
    optionalText: String?;
}

contract MixedOptionalsContract {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            requiredFlag: true,
            optionalFlag: null,
            requiredNum: 55,
            optionalNum: null,
            requiredText: "hello",
            optionalText: null
        };
    }
}