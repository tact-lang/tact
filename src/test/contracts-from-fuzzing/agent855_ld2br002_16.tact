struct DeepOpt1 { a: Int? }
struct DeepOpt2 { b: DeepOpt1 }
struct DeepOpt3 { c: DeepOpt2 }

contract NestedNullableLeaves {
    val: DeepOpt3;
    init() {
        self.val = DeepOpt3{ c: DeepOpt2{ b: DeepOpt1{ a:null } } };
    }
}