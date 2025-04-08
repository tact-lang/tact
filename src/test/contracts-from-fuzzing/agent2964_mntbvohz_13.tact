struct DeepStruct {
    nested: MidStruct;
}

struct MidStruct {
    pair: PairStruct;
}

struct PairStruct {
    left: Int;
    right: String;
}

contract CombinedNested {
    storage: DeepStruct;

    init() {
        self.storage = DeepStruct{
            nested: MidStruct{
                pair: PairStruct{
                    left: 7,
                    right: "seven"
                }
            }
        };
    }
}