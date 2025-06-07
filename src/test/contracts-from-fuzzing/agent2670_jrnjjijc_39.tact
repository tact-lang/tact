struct ManyOptionals {
  o1: Int?;
  o2: Int?;
  o3: Int?;
  o4: Int?;
  o5: Int?;
}

contract ManyOptionalsTest {
  field: ManyOptionals;

  init() {
    self.field = ManyOptionals{ o1:null, o2:null, o3:null, o4:null, o5:null };
  }
}