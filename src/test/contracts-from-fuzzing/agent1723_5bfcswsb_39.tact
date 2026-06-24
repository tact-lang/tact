struct Another1 { 
 x: String; 
 y: Int?;
}

contract AnotherOptional {
  f: Another1?;

  init() {
    self.f = null;
  }
}