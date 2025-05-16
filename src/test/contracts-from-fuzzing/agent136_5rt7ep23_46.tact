struct MixedNested {
    i: Int;
    b: Bool;
    o: Int?;
    s: String;
    x: Int as uint8; 
}

contract MixedTest {
    m: MixedNested;

    init() {
        self.m = MixedNested{
            i: 7, b: true, o: null, s: "hi", x: 254
        };
    }
}