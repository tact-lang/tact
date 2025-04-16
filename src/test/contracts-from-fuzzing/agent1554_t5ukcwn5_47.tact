struct DeepOpt1 { y: Int?; }
struct DeepOpt2 { inner: DeepOpt1?; }
contract NestedOptionalDeep {
    st: DeepOpt2;

    init() {
        self.st = DeepOpt2{ inner: null };
    }
}