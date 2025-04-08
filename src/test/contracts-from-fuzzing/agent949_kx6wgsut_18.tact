struct StringsAndBools {
    str: String;
    flag: Bool;
    maybe: Bool?;
}

contract MixTest {
    data: StringsAndBools;

    init() {
        self.data = StringsAndBools{
            str: "Tact",
            flag: true,
            maybe: null
        };
    }
}
