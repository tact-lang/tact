struct Dirty {
 x: Int = 1;
 y: Int?;
}

contract UseDefaultOpt {
  data: Dirty;

  init() {
    self.data = Dirty{ x:2, y:null };
  }
}