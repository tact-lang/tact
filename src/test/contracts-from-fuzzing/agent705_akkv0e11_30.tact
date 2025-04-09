struct OptionalMix {
    ai: Int?;
    ab: Bool?;
    aa: Address?;
    ac: Cell?;
    as_: Slice?;
    astr: String?;
}

contract OptionalMixTest {
    data: OptionalMix;

    init() {
        self.data = OptionalMix { ai:null, ab:null, aa:null, ac:null, as_:null, astr:null };
    }
}