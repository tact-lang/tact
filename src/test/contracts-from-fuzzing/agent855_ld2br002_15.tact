struct DeepOpt1 { a: Int? }
struct DeepOpt2 { b: DeepOpt1? }
struct DeepOpt3 { c: DeepOpt2? }

contract NullableDeep {
    f: DeepOpt3;
    init() {
        self.f = DeepOpt3{ c: null };
    }
}