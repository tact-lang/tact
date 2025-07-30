struct SOpt {
  a: Int?;
}
contract MultOptStructs {
  x: SOpt;
  y: SOpt;

  init() {
    self.x = SOpt{a:null};
    self.y = SOpt{a:null};
  }
}