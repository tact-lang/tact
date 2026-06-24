struct OptionalDeep {
    x: Int?;
    sub: SubDeep?;
}

struct SubDeep {
    y: Int;
    z: Bool?;
}

contract OptionalDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            x:null,
            sub:null
        };
    }
}