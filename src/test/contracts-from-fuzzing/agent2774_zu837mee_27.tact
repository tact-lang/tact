// message struct embedded inside persistent storage struct
message(0x1) M1 { val: Int }

struct Wrap {
   m: M1;
}

contract TestContract {
  field: Wrap;

  init() {
    self.field = Wrap{
      m: M1{val:5}
    };
  }
}