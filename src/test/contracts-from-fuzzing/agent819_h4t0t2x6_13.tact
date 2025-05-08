struct Meta {
  name: String;
  description: String;
  image: String?;
  external_url: String?;
  decimals: Int;
  created_at: Int;
}

contract TestContract {
  meta: Meta;

  init() {
    self.meta = Meta{
      name: "Ton Token",
      description: "Example token contract",
      image: null,
      external_url: null,
      decimals: 9,
      created_at: 1700000000
    };
  }
}