struct MixTypes {
    x: Int;
    y: Bool;
    z: String;
}

contract DifferentFieldTypes {
    val: MixTypes;

    init() {
        self.val = MixTypes{ x: 7, y: true, z: "test" };
    }
}