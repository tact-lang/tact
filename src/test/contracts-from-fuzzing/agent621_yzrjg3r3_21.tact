struct DeepOpt1 { next: DeepOpt2? }
struct DeepOpt2 { next: DeepOpt3? }
struct DeepOpt3 { value: Int? }

contract Test {
  s: DeepOpt1;

  init() {
    self.s = DeepOpt1{
      next: DeepOpt2{
        next: null
      }
    };
  }
}
