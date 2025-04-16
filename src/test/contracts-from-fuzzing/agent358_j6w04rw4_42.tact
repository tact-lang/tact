struct SM {
 a: Int;
 b: Bool;
 s: String;
 c: Cell;
 sl: Slice;
 bu: Builder;
}

contract PersistMixed {
 m: SM;
 init() {
   self.m = SM{
     a:1,
     b:true,
     s:"hi",
     c:emptyCell(),
     sl:emptyCell().asSlice(),
     bu:beginCell()
   };
 }
}