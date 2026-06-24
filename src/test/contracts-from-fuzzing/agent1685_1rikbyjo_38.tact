struct MixTypes {
    x: Int;
    y: Bool;
    z: Address;
    s: String;
    c: Cell;
    sl: Slice;
}

contract MixTest {
    snap: MixTypes;

    init() {
        self.snap = MixTypes{
            x:42,
            y:true,
            z:myAddress(),
            s:"hi",
            c:emptyCell(),
            sl:emptyCell().asSlice()
        };
    }
}
