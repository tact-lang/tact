struct Texts {
 s: String;
 opt: String?;
}

contract OptStrContract {
 val: Texts;
 init() {
  self.val = Texts{
    s: "hello",
    opt: null
  };
 }
}