struct S11 { f: Int }
struct S12 { f: Int }
struct S21 { s11: S11; }
struct S22 { s12: S12; }
struct Top {
 s21: S21;
 s22: S22;
}

contract BigNest {
 top: Top;

 init() {
   self.top = Top{
     s21: S21{ s11: S11{ f: 1 } },
     s22: S22{ s12: S12{ f: 2 } }
   };
 }
}