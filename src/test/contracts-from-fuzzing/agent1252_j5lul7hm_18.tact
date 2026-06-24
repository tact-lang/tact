struct NestedMix {
    x: Int;
    y: Inner1;
    z: Inner2;
}

struct Inner1 {
    b: Bool;
    s: String;
}

struct Inner2 {
    addr: Address;
    sl: Slice;
}

contract NestedMixContract {
    mixed: NestedMix;

    init() {
        self.mixed = NestedMix{
            x: 5,
            y: Inner1{ b:true, s:"abc" },
            z: Inner2{ addr:myAddress(), sl:emptyCell().asSlice() }
        };
    }
}
