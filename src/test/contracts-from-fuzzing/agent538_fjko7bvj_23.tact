contract CrossTypes {
 a: Int = 10;
 b: Bool = false;
 c: String = "hi";
 d: Address;
 e: Cell;
 f: Slice;
 g: String = "there";

 init() {
   self.a = 100;
   self.b = true;
   self.c = "hello";
   self.d = myAddress();
   self.e = emptyCell();
   self.f = emptyCell().asSlice();
   self.g = "again";
 }
}
