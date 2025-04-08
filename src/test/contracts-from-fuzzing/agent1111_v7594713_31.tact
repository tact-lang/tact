// test contract parameter style with multi-nested optional
struct L3 { leaf:Int?; }
struct L2 { mid:L3?; }
struct L1 { top:L2?; }
contract ParamDeepOpt(
 d:L1
) {
 receive() {
   if (self.d.top != null) {
     let _ = 1;
   }
 }
}