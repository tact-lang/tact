struct SBool { f: Bool }
struct SIntOpt { g: Int? }
struct SBoth { sbool: SBool; sintopt: SIntOpt }

contract WrappedOptions {
  data: SBoth?;

  init() {
    self.data = null;
  }
}