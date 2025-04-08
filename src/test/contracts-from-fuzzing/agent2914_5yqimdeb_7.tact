struct DeepOpt3 { z: Int?; }
struct DeepOpt2 { y: DeepOpt3?; }
struct DeepOpt1 { x: DeepOpt2?; }

contract DeepNestedOptionals {
    val: DeepOpt1 = DeepOpt1{ x: null };

    init() {}
}