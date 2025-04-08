struct IntAndString {
    number: Int;
    text: String;
}

struct MixedNested {
    inner1: IntAndString;
    inner2: Bool;
    inner3: String?;
    inner4: Int?;
}

contract MixedStorage {
    data: MixedNested;

    init() {
        self.data = MixedNested{
            inner1: IntAndString{
                number: 100,
                text: "Mixed"
            },
            inner2: false,
            inner3: "optional",
            inner4: null
        };
    }
}
