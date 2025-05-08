struct Packet {
  p1: P1;
  p2: P2;
}

struct P1 {
  p11: Int;
  p12: Int;
}

struct P2 {
  p21: Int;
  p22: Int;
}

contract TestContract {
  pkt: Packet;

  init() {
    self.pkt = Packet{
      p1: P1{p11:1,p12:2},
      p2: P2{p21:3,p22:4}
    };
  }
}