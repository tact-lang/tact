struct DeepDefault {
 x: Int = 5;
}
struct Wrapper {
 val: DeepDefault = DeepDefault{};
}

contract NestedDefaults {
 d: Wrapper;
 init() {
  self.d = Wrapper{};
 }
}