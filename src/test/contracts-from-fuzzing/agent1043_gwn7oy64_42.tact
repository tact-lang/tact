// Test using constants as default field values
const DEF_STR: String = "def";

struct WithConstDefault {
  s: String = DEF_STR;
}

contract TestContract {
  wcd: WithConstDefault;

  init() {
    self.wcd = WithConstDefault{};
  }
}