struct S {
 a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice;
}

contract MultiStructs {
 s1: S; s2: S; s3: S;

 init() {
  self.s1 = S{a:1,b:true,c:"",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice()};
  self.s2 = self.s1;
  self.s3 = self.s1;
 }
}
