struct MixedOptions {
    optInt: Int?;
    optBool: Bool?;
    str: String = "abc";
    fixedInt: Int = 5;
    optString: String?;
    fixedBool: Bool = true;
}

contract MixedOptionsContract {
    data: MixedOptions = MixedOptions{};

    init() {
        self.data = MixedOptions{
            optInt: 123,
            optBool: false,
            str: "def",
            fixedInt: 42,
            optString: "hello",
            fixedBool: false
        };
    }
}