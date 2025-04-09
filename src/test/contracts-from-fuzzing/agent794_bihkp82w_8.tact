struct DeepOpt3 { val: Int?; }
struct DeepOpt2 { next: DeepOpt3?; }
struct DeepOpt1 { next: DeepOpt2?; }

contract DeepOptionalNest {
    deep: DeepOpt1? = null;
    init() {}
}