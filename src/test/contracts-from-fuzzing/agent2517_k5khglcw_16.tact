struct Holder {
 bigStr: String;
}

contract Test {
 h: Holder;

 init() {
  self.h = Holder{ bigStr: "Hello World!" };
 }
}