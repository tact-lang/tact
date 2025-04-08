struct LargeStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
  e: Bool;
  f: String;
  g: Address;
  h: Int;
  i: Bool;
  j: String;
  k: Address;
}

contract TestContract {
  big: LargeStruct;

  init() {
    self.big = LargeStruct{
      a:1,
      b:true,
      c:"c",
      d:2,
      e:false,
      f:"f",
      g:myAddress(),
      h:3,
      i:true,
      j:"j",
      k:myAddress()
    };
  }
}