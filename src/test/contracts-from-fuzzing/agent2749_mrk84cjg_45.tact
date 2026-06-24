struct S1 { a: Int as int64; }

contract SerialInStruct {
 val: S1;
 init() {
  self.val = S1{ a: -12345678 };
 }
}