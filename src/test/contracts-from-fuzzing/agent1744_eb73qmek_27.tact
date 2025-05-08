// very large struct with nested optional messages
message(1) M1 { f: Int }
message(2) M2 { f: Int }
message(3) M3 { f: Int }

struct LargeComplex {
  a: Int;
  b: String;
  c: Bool;
  d: Address;
  e: M1?;
  f: M2?;
  g: M3?;
  h: String?;
  i: Address?;
}

contract StorageLargeComplex {
  data: LargeComplex;

  init() {
    self.data = LargeComplex{
      a:1,b:"hi",c:true,d:myAddress(),e:null,f:null,g:null,h:null,i:null
    };
  }
}
