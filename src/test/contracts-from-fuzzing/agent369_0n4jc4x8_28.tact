struct SWithBoolIntStringOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract StructWithOptionalsTest {
    s: SWithBoolIntStringOpt;

    init() {
        self.s = SWithBoolIntStringOpt{
            x:null,
            y:null,
            z:null,
        };
    }
}