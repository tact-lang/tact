struct DeepOpt1 { val: Int?; }
struct DeepOpt2 { inner: DeepOpt1?; }
struct DeepOpt3 { deeper: DeepOpt2?; }

contract DeeplyOptional {
    value: DeepOpt3?;

    init() {
        self.value = DeepOpt3{ deeper: DeepOpt2{ inner: DeepOpt1{ val: null }}};
    }
}