struct Info { label: String?; amount: Int?; }
struct Container { info: Info?; flag: Bool; }

contract MixOpt {
  field: Container;

  init() {
    self.field = Container{ info: null, flag: false };
  }
}