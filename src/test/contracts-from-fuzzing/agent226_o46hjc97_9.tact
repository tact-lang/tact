struct MixType {
    i: Int;
    s: String;
    b: Bool;
}

contract TestMix {
    data: MixType;

    init() {
        self.data = MixType{
            i: 5,
            s: "hello",
            b: false
        };
    }
}
