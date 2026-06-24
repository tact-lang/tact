struct Comb {
 a: Int;
 b: Bool;
 c: String?;
 d: Int as uint64;
 e: Bool?;
 f: Int? as uint8;
}

contract TestContract {
 comb: Comb;
 init() {
  self.comb = Comb{
    a: 1337,
    b: true,
    c: null,
    d: 123,
    e: null,
    f: null
  };
 }
}