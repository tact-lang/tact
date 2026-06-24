// Mix of default, optional with default null, non-optional fields
struct Combo {
 a: Int = 5;
 b: Bool?;
 c: String;
 d: Int?;
}

contract ComboTest {
 x: Combo;
 init() {
   self.x = Combo { a:100, b:null, c:"hi", d:null };
 }
}