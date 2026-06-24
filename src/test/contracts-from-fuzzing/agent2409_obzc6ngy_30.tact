struct AA {
  x: Int;
  y: Bool;
}

struct BB {
  aa: AA;
}

struct CC {
  bb: BB;
}

struct DD {
  cc: CC; 
}

struct EE {
  dd: DD;
}

contract ManyNestDepth5 {
  e: EE;

  init() {
    self.e = EE{ dd: DD{ cc: CC{ bb: BB{ aa: AA{ x: 1, y: true } } } } };
  }
}