struct InnerMost { val: Int; }
struct InnerWrap { inn: InnerMost; }
struct OuterWrap { mid: InnerWrap; }

contract DeepCompose {
  myval: OuterWrap;

  init() {
    self.myval = OuterWrap{ mid: InnerWrap{ inn: InnerMost{ val: 123 } } };
  }
}