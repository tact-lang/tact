struct Mix {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    valInt: Int;
    valBool: Bool;
    valString: String;
}

contract OptionalsAndRequired {
    val: Mix;

    init() {
        self.val = Mix{
            optInt: null,
            optBool: null,
            optString: null,
            valInt: 100,
            valBool: true,
            valString: "done",
        };
    }
}