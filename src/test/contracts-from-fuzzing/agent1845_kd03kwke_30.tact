// Struct containing struct containing optionals
struct Bottom {
  f1: Int?;
  f2: Bool?;
}
struct Top {
  nested: Bottom;
  other: Int;
}
contract StructNestOpt {
  t: Top;
  init() {
    self.t = Top{
      nested: Bottom{ f1:null, f2:null },
      other: 5
    };
  }
}
