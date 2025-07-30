struct NestOpt1 { val: Int? }
struct NestOpt2 { inner: NestOpt1? }
struct NestOpt3 { inner: NestOpt2? }

contract DeepOptStructs {
  opt3: NestOpt3?;

  init() {
    self.opt3 = null;
  }
}
