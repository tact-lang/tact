struct Nester {
 sub: Sub;
}
struct Sub {
 inner: Inner;
}
struct Inner {
 val: Int;
}
contract Nestie {
 f: Nester;
 init() {
  self.f = Nester{ sub: Sub{ inner: Inner{ val: 30 } } };
 }
}