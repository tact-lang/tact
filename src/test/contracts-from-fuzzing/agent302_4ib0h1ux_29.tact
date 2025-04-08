struct Down1 { d2: Down2 }
struct Down2 { d3: Down3 }
struct Down3 { d4: Down4 }
struct Down4 { d5: Down5 }
struct Down5 { d6: Down6 }
struct Down6 { val: Int }

contract Layers6 {
  v: Down1;

  init() {
    self.v = Down1{ d2: Down2 { d3: Down3 { d4: Down4 { d5: Down5 { d6: Down6 { val: 6 }}}}}};
  }
}