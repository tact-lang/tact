// deeply nested bool optionals
struct DeepOpt3 { z: Bool? }
struct DeepOpt2 { y: DeepOpt3? }
struct DeepOpt1 { x: DeepOpt2? }

contract Test {
    d: DeepOpt1;

    init() {
        self.d = DeepOpt1{ x: DeepOpt2{ y: DeepOpt3{ z: null } } };
    }
}