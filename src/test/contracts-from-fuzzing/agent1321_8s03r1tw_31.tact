struct MixedTypes {
    x: Slice;
    y: Cell;
    z: Address;
    text: String;
    big: Int as int257;
}

contract Combo {
    f: MixedTypes;
    init() {
        self.f = MixedTypes{
            x: emptyCell().asSlice(),
            y: emptyCell(),
            z: myAddress(),
            text: "mix",
            big: 99999
        };
    }
}