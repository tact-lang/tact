struct OptionDeep1 { o: OptionDeep2?; }
struct OptionDeep2 { o: OptionDeep3?; }
struct OptionDeep3 { leaf: Int?; }

contract OptionDeepTest {
  s: OptionDeep1;

  init() {
    self.s = OptionDeep1{
      o: OptionDeep2{
        o: OptionDeep3{
          leaf: null
        }
      }
    };
  }
}