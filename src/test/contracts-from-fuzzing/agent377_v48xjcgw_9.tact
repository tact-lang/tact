struct Config {
  flag: Bool;
  note: String;
}

struct Wrapper {
  cfg: Config?;
}

contract TestContract {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      cfg: Config{
        flag: true,
        note: "test"
      }
    };
  }
}