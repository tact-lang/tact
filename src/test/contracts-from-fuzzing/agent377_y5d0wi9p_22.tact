struct InnerA {
 a: Int;
}
struct InnerB {
 b: Int?;
}
struct InnerC {
 c: Bool;
}
struct InnerD {
 d: String;
}
struct Combo {
 ia: InnerA;
 ib: InnerB;
 ic: InnerC;
 id: InnerD;
}

contract ComboNested {
 combo: Combo = Combo{
   ia: InnerA{a:10},
   ib: InnerB{b:null},
   ic: InnerC{c:true},
   id: InnerD{d:"x"}
 };
}