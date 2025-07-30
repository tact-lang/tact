// Optional of a struct with inner optionals
struct InnerOpt {
  a: Int?;
  b: Bool?;
}

contract WrapOptStruct {
    data: InnerOpt?;
    init() {
        self.data = null;
    }
    receive() {
        self.data = InnerOpt{ a:1, b:true };
    }
}