struct EdgeCases {
    ai: Int;
    bi: Int?;
    ab: Bool;
    bb: Bool?;
    as_: String;
    bs: String?;
}

contract EdgeCaseFields {
    ec: EdgeCases;

    init() {
        self.ec = EdgeCases{
            ai:1,
            bi:null,
            ab:true,
            bb:null,
            as_:"yes",
            bs:null
        };
    }
}