// Struct with multiple Int, Bool, String, optional Int, optional String
struct MultiType {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: String?;
}

contract MultiFieldTypes {
  state: MultiType;

  init() {
    self.state = MultiType{
      a:1, b:true, c:"hello", d:null, e:null
    };
  }
}