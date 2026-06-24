struct Inner1 {
  x: Int
}

struct Inner2 {
  i1: Inner1
}

struct Inner3 {
  i2: Inner2
}

struct Complex {
  prefix: String;
  optNum: Int?;
  nested: Inner3;
}

contract StorageContract {
  field: Complex;

  init() {
    self.field = Complex{
      prefix: "ok",
      optNum: null,
      nested: Inner3{
        i2: Inner2{
          i1: Inner1{ x: 99 }
        }
      }
    };
  }
}