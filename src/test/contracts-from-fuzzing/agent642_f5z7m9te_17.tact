struct OptionalMix {
    ai: Int?;
    ab: Bool?;
    as1: String?;
    ac: Cell?;
    asl: Slice?;
}

struct WithOpt {
    x: Int;
    y: OptionalMix;
}

contract TestContract {
    persist: WithOpt;

    init() {
        self.persist = WithOpt{
            x: 111,
            y: OptionalMix{ ai:null, ab:null, as1:null, ac:null, asl:null }
        };
    }
}