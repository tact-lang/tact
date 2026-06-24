struct DeepOptional {
    s: SubDeep?;
}
struct SubDeep {
    a: Bool;
    name: String?;
}
contract C {
    x: DeepOptional;
    init() {
        self.x = DeepOptional{ s: null };
    }
}