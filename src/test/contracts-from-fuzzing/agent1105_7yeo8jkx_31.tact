struct S1 { a:Int; }
struct S2 { x:S1?; }
contract OptionalStructTest {
   field: S2;
   init(){ self.field = S2{ x:null }; }
}