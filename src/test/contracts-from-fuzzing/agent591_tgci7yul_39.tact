struct DeepOpt1 { x: Int?; }
struct DeepOpt2 { sub: DeepOpt1?; }
struct DeepOpt3 { sub: DeepOpt2?; }
contract ManyLevelsOptional {
    lvl: DeepOpt3?;
    init() {
        self.lvl = null;
    }
}