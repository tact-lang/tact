struct L6 { v:Int? = null; }
struct L5 { l6: L6; flag:Bool = false; }
struct L4 { l5: L5?; s:String = ""; }
struct L3 { l4: L4; n:Int=0; }
struct L2 { l3: L3?; }
struct L1 { l2: L2; }

contract DeepDefaults {
  data: L1;

  init() {
    self.data = L1{ l2: L2{ l3: null } };
  }
}