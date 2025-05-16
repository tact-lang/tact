struct Mix {
    one: Int;
    two: Bool;
    three: String;
    four: Int?;
    five: Bool?;
    six: String?;
}

contract NestedMix {
    val: Mix;
    optVal: Mix?;

    init() {
        self.val = Mix{
            one: 1, two: true, three: "hi", four: null, five: null, six: null
        };
        self.optVal = null;
    }
}