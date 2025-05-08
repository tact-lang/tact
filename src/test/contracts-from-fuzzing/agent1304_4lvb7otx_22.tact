message(1) M { x: Int }

struct Inner {
 n: Int?;
 m: M;
}

struct Outer {
 inner: Inner;
}

contract MsgStructMix {
 data: Outer;

 init() {
  self.data = Outer{ inner: Inner{ n:null, m:M{ x:5 } } };
 }
}