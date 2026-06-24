struct InnerA { f: Int }
struct InnerB { g: Int }

struct Wrapper {
  optA: InnerA?;
  optB: InnerB?;
}

contract MultiOptStruct {
  data: Wrapper = Wrapper{ optA: null, optB: null };
  init() {
    self.data = Wrapper{
      optA: InnerA{ f: 1 },
      optB: InnerB{ g: 2 }
    };
  }
}
