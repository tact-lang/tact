struct Combo {
 a: Int;
 b: Int?;
 c: String;
 d: String?;
 e: Bool;
 f: Bool?;
 g: Address;
 h: Address?;
 i: Cell;
 j: Cell?;
}

contract ComboTest {
 val: Combo;

 init() {
   self.val = Combo{
     a:1,
     b:null,
     c:"hi",
     d:null,
     e:true,
     f:null,
     g:myAddress(),
     h:null,
     i:emptyCell(),
     j:null,
   };
 }
}