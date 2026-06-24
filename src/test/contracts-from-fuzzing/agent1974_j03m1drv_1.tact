struct OptionalDeep {
    innerOpt: Int?;
    another: Bool;
}

struct MidLayer {
    optStruct: OptionalDeep?;
    val: Int;
}

contract TestStorage {
    layer: MidLayer;

    init() {
        self.layer = MidLayer{
            optStruct: null,
            val: 0,
        };
    }
}
