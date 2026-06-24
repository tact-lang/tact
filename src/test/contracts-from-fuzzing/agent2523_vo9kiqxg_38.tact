// deeply nested branch optional
struct L3 { x:Int?; }
struct L2 { l3:L3?; y:Bool; }
struct L1 { l2left:L2?; l2right:L2; }
contract DeepBranches {
  data:L1;
  init() {
    self.data=L1{
      l2left:null,
      l2right:L2{
        l3:L3{x:null},
        y:true
      }
    };
  }
}