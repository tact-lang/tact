// nested messages inside persistent struct
message(0x1111) M1 { a: Int }
message(0x2222) M2 { m1: M1 }

struct Container {
  msg: M2;
}

contract TestContract {
  val: Container;

  init() {
    self.val = Container{
      msg: M2{
        m1: M1{ a:123 }
      }
    };
  }
}