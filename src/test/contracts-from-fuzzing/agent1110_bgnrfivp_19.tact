struct BigNest {
  l1: String;
  l2: String;
  l3: String;
  l4: String;
  l5: String;
  l6: String;
  l7: String;
  l8: String;
  l9: String;
  l10: String;
}

contract ManyStrings {
  data: BigNest;

  init() {
    self.data = BigNest{
      l1:"1", l2:"2", l3:"3", l4:"4", l5:"5",
      l6:"6", l7:"7", l8:"8", l9:"9", l10:"10"
    };
  }
}