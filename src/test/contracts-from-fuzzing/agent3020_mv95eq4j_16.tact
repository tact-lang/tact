struct StrctA {
 a: Int; b: Bool; c: Address; d: Cell; e: Slice; f: String;
}

struct StrctB {
 g: StrctA; h: StrctA; i: StrctA;
}

contract StructLayering {
 big: StrctB;

 init() {
  self.big = StrctB{
   g: StrctA{a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"f"},
   h: StrctA{a:2,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"g"},
   i: StrctA{a:3,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"h"}
  };
 }
}
