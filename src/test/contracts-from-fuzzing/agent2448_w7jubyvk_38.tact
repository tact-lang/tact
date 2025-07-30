struct SOptDefault {
    x: Int?;
    y: Bool = false;
    s: String?;
}

contract OptDefaultMix {
    val: SOptDefault;

    init() {
        self.val = SOptDefault{
            x: null,
            s: null,
        };
    }
}
