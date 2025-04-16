// optional deeply optional struct
struct Leaf {
  a:Int?;
  b:String?;
}
struct Mid {
  nest: Leaf?;
}
contract OptDeepStruct {
  data: Mid?;
  init() {
    self.data = Mid{
      nest:null
    };
  }
}