struct LargeStruct1 {
  a: Int;
  b: Int;
  c: Bool;
  d: Bool;
  e: Address;
  f: Address;
  g: String;
  h: String;
}

struct LargeStruct2 {
  i: Int?;
  j: Bool?;
  k: Address?;
  l: String?;
  m: Int;
}

struct Container {
  first: LargeStruct1;
  second: LargeStruct2;
}

contract Holder {
  val: Container;

  init() {
    self.val = Container{
      first: LargeStruct1{
        a:1,b:2,c:true,d:false,e:myAddress(),f:myAddress(),g:"a",h:"b"
      },
      second: LargeStruct2{
        i:null,j:true,k:null,l:"zzz",m:42
      }
    };
  }
}