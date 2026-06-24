struct DeepOpt1 { f: Int?; }
struct DeepOpt2 { f: DeepOpt1?; }
struct DeepOpt3 { f: DeepOpt2?; }
struct DeepOpt4 { f: DeepOpt3?; }

contract OptLevels {
    field: DeepOpt4;

    init() {
        self.field = DeepOpt4{ f: null };
    }
}