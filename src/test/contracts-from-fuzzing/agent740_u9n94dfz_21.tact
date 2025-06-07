struct SerializeFormats {
 a: Int as int64;
 b: Int as uint4;
 c: Int as uint1;
 d: Int as int257;
}

contract SerializeFormatsTest {
 s: SerializeFormats;
 init() {
 self.s = SerializeFormats{ a:1, b:5, c:1, d:-100 };
 }
}