struct Chain1 { n: Int? }
struct Chain2 { next: Chain1? }
struct Chain3 { next: Chain2? }
struct Chain4 { next: Chain3? }

contract OptionalNest {
  data: Chain4;

  init() {
    self.data = Chain4{ next: null };
  }
}