// Deeply nested with optionals at different levels
struct Bottom { val:Int; }
struct Mid { bottom:Bottom?; flag:Bool; }
struct Top { mid:Mid; s:String?; }

contract Test {
  hierarchy: Top;

  init() {
    self.hierarchy = Top{
      mid: Mid{ bottom:null, flag:true },
      s: null
    };
  }
}