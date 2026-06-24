struct DeepWOpt5 {
    e: Int?;
}
struct DeepWOpt4 {
    d: DeepWOpt5?;
}
struct DeepWOpt3 {
    c: DeepWOpt4?;
}
struct DeepWOpt2 {
    b: DeepWOpt3?;
}
struct DeepWOpt1 {
    a: DeepWOpt2?;
}

contract DeepOptChainTest {
    data: DeepWOpt1;
    init() {
        self.data = DeepWOpt1 {
            a: null
        };
    }
}