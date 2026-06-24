struct Weird {
  a: Int;
  b: String?;
  c: Int as uint23;
  d: Bool?;
  e: String;
}

contract WeirdStorage {
  data: Weird;

  init() {
     self.data = Weird{
        a: 11,
        b: null,
        c: 1000000,
        d: true,
        e: "str"
     };
  }
}