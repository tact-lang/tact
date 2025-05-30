// deeply nested optional, no default, assign from parameters
struct Last { val:Int?; }
struct Mid { last: Last?; }
struct Top { mid: Mid?; }
contract DeepParams(
 par: Top
) {
 receive() {
  if (self.par.mid != null) {
   let _ = 1;
  }
 }
}