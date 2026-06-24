struct TwoOptionals {
  x: Int?;
  y: String?;
}

contract TwoOptsContract {
  data: TwoOptionals;

  init() {
    self.data = TwoOptionals{ x:null, y:null };
  }
}