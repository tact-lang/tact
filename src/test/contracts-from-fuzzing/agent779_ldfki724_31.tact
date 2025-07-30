struct MultiStr {
 a: String; b: String?; c: String;
 d: String?; e: String; f: String?;
}
contract StringsTest {
 data: MultiStr;
 init() {
  self.data = MultiStr{
   a: "x", b: null, c: "y",
   d: "z", e: "u", f: null
  };
 }
}