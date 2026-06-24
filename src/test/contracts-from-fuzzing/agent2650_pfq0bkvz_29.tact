struct S1 { inner: S2; }
struct S2 { val: Int; }
contract Test { x:S1; init(){ self.x = S1{ inner:S2{val:1} }; } }