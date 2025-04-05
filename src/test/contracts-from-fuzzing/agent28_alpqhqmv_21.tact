message CustomTypes {
  n: Int;
  s: Slice?;
  b: Builder?;
  c: Cell?;
  a: Address?;
}

contract Test {
  receive() {
    let ct: CustomTypes = CustomTypes{n:1,s:null,b:null,c:null,a:null};
  }
}