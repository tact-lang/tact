struct MultiType {
    i: Int;
    b: Bool;
    s: String;
}

contract MixedTypes {
    f: MultiType;

    init() {
        self.f = MultiType{
            i: 1,
            b: false,
            s: "test"
        };
    }
}