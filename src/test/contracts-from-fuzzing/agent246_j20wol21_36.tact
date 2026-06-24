struct StructOne {
    a: Int; b: String; c: Bool
}
struct StructTwo {
    x: StructOne; y: Int; z: String
}
contract Combo {
    s: StructTwo;
    init() {
        self.s = StructTwo{
            x: StructOne{a:5, b:"ok", c:true},
            y: 42,
            z: "done",
        };
    }
}