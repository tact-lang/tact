struct Ints {
 a: Int;
 b: Int as int64;
 c: Int as uint4;
 d: Int as uint8;
 e: Int;
}

contract IntContract {
 val: Ints;

 init() {
   self.val = Ints{ a:1, b:2, c:3, d:4, e:5 };
 }
}