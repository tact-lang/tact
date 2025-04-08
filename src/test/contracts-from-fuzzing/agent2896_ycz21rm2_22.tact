struct Base {
 v1: Int; v2: Bool; v3: String;
}

contract BaseOpt {
 a: Base?;

 init() {
  self.a = Base{
    v1: 5,
    v2: true,
    v3: "txt"
  };
 }
}