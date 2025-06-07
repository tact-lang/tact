struct VariantTypes {
  count: Int as int32;
  price: Int as coins;
  desc: String;
  active: Bool;
}

contract DifferentSerial {
  vf: VariantTypes;
  
  init() {
    self.vf = VariantTypes{
      count: 100,
      price: ton("2"),
      desc: "desk",
      active: true
    };
  }
}