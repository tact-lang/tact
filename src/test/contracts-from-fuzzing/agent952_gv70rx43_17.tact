struct DiverseFields {
    x: Int;
    y: Bool;
    z: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract Diverse {
    data: DiverseFields;

    init() {
        self.data = DiverseFields{
            x: 10,
            y: true,
            z: "hi",
            optInt: null,
            optBool: false,
            optString: null
        };
    }
}
