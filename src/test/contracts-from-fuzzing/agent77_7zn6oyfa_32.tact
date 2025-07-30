// Optional nested struct, inside optional struct again
struct SInner { val: Int; }
struct SMid { inner: SInner?; }
struct SOuter { mid: SMid?; }

contract DeepOpt {
 s: SOuter;
 init() {
   self.s = SOuter{ mid: null };
 }
}