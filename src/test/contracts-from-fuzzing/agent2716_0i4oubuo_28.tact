struct Lvl1 { v: Int; }
struct Lvl2 { l1: Lvl1; }
struct Lvl3 { l2: Lvl2; }
struct Lvl4 { l3: Lvl3; }
struct Lvl5 { l4: Lvl4; }
struct Lvl6 { l5: Lvl5; }
struct Lvl7 { l6: Lvl6; }

contract Deep7 {
  data: Lvl7;

  init() {
    self.data = Lvl7{l6: Lvl6{l5: Lvl5{l4: Lvl4{l3: Lvl3{l2: Lvl2{l1: Lvl1{v: 7}}}}}}};
  }
}