struct MixOptional {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Address;
    f: Slice?;
}

contract TestContract {
    m: MixOptional;

    init() {
        self.m = MixOptional{
            a: 5,
            b: null,
            c: "mix",
            d: null,
            e: myAddress(),
            f: null
        };
    }
}