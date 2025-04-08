struct DeepOption {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Container {
    nested: DeepOption;
    caption: String;
}

contract OptionalNested {
    data: Container;
    init() {
      self.data = Container{
         nested: DeepOption{ f1:null, f2:true, f3:null },
         caption: "hello"
      };
    }
}
