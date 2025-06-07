message(5) M5 {}

struct Cont {
  m: M5;
}

contract MsgInStruct {
  v: Cont = Cont{ m: M5{} };
}