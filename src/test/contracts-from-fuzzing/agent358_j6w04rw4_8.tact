struct Defaults {
  x: Int = 10;
  y: Bool = false;
  txt: String = "hi";
  optX: Int?; 
}

contract DefaultVals {
  data: Defaults;

  init() {
    self.data = Defaults{
      optX: null,
    };
  }
}