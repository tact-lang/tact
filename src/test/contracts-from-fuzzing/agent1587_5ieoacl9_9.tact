struct OptionalDeep {
    sub: SubLevel?;
}

struct SubLevel {
    val: Int;
    flag: Bool?;
}

contract OptionallyNested {
    od: OptionalDeep;

    init() {
        self.od = OptionalDeep{
            sub: null
        };
    }
}