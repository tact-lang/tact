struct DeepOpt {
    x: Int?;
    y: Bool?;
}

struct ParamsNest {
    level: Int;
    nested: DeepOpt?;
}

contract TestContract(
    counter: Int,
    flag: Bool?,
    nested: ParamsNest?,
) {
    receive() {
        // trivial contract body just to reference all params
        let _ = self.counter + 1;
    }
}