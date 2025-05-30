struct HasManyOpt {
  o1: Int?;
  o2: Int?;
  o3: String?;
  o4: Bool?;
}

contract MostlyNull {
  val: HasManyOpt;

  init() {
    self.val = HasManyOpt{
      o1:null,o2:null,o3:null,o4:null
    };
  }
}