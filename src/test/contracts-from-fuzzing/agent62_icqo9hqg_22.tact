struct Sub {
  sVal: Int;
}
struct OuterSub {
  s: Sub?;
}
contract OptionInStruct {
    val: OuterSub;

    init() {
        self.val = OuterSub{ s: null };
    }
}