struct OptOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptInits {
    val: OptOpt;
    init() {
        self.val = OptOpt{
            x: null,
            y: null,
            z: null,
        };
    }
}