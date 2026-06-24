struct DeeplyNested {
    aa: Int;
    bb: Bool?;
    cc: String;
}

struct MiddlyNested {
    inside: DeeplyNested;
    maybeStr: String?;
}

struct TopMost {
    mid: MiddlyNested;
}

contract DeepMix {
    data: TopMost;

    init() {
        self.data = TopMost{
            mid: MiddlyNested{
                inside: DeeplyNested{
                    aa: 123, bb: null, cc: "yo"
                },
                maybeStr: null
            }
        };
    }
}