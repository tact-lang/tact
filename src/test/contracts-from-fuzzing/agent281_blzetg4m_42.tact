// Compose a wide and deep nested optional/default heavy struct
struct Inner1 { a: Int? = null; b: Bool = true; }
struct Inner2 { c: String? = null; d: Bool?; }
struct Inner3 { e: Int = 42; f: String; }

struct TopMega {
   x: Inner1;
   y: Inner2;
   z: Inner3;
}

contract MegaComboTest {
   data: TopMega;

   init() {
     self.data = TopMega{
       x: Inner1{},
       y: Inner2{ c: null, d: null },
       z: Inner3{ e: 42, f: "hi" }
     };
   }
}