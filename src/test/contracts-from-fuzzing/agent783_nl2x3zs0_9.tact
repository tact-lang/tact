struct Config {
  version: Int;
  active: Bool;
  description: String;
  param: Int?;
}

struct Wrapper {
  main: Config;
  backup: Config?;
  alias: String?;
}

contract ComplexHolder {
  state: Wrapper?;

  init() {
    self.state = Wrapper{
      main: Config{version:1,active:true,description:"desc",param:null},
      backup: null,
      alias: null
    };
  }
}