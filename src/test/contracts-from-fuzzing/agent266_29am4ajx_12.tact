struct Mix {
    i: Int;
    b: Bool;
    s: String?;
    addr: Address;
    slice: Slice;
    builder: Builder;
}

contract MixTypes {
    mix: Mix;

    init() {
        self.mix = Mix{
            i: 99,
            b: true,
            s: null,
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            builder: beginCell(),
        };
    }
}