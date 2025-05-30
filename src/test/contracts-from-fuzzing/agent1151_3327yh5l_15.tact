struct OptS {
    sa: Int?;
    sb: String?;
    sc: Bool?;
}

contract DeepOptionalMix {
    os: OptS;
    init() {
        self.os = OptS{
            sa: null,
            sb: null,
            sc: true
        };
    }
}