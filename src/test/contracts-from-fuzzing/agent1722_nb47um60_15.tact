struct OptionalDeep {
    sub: SubData?;
}

struct SubData {
    x: Int;
    y: String;
    flag: Bool?;
}

contract OptNest {
    val: OptionalDeep;
    init() {
        self.val = OptionalDeep{
            sub: SubData{
                x: 5,
                y: "ok",
                flag: null
            }
        };
    }
}