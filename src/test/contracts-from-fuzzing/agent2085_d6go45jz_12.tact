struct ComplexOpts {
 flag: Bool;
 num: Int?;
 data: Data?;
}

struct Data {
 text: String;
 amount: Int;
}

contract TestContract {
 data: ComplexOpts;
 
 init() {
  self.data = ComplexOpts{
    flag: true,
    num: null,
    data: Data{
      text: "hey",
      amount: 999
    }
  };
 }
}