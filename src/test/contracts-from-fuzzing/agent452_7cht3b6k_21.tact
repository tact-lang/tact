struct SSub { num:Int; text:String }
struct SMain {
    x:Int;
    sub:SSub;
    opt:String?;
}

contract Test21 {
  s: SMain;
  init() {
     self.s = SMain{
       x: 7,
       sub: SSub{ num: 8, text: "hi" },
       opt: null
     };
  }
}
