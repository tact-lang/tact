struct Tiny {
  v: Int as uint4;
}

struct Container {
  data: Tiny?;
  count: Int = 0;
}

contract TestContract {
  val: Container = Container{
    data: null,
    count: -1
  };

  init() {
    self.val = Container{
      data: Tiny{
        v: 7
      },
      count: 99
    };
  }
}
