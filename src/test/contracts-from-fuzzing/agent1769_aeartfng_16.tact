struct HasManyOptionals {
  x1: Int?;
  x2: Int?;
  x3: Int?;
  x4: Int?;
  x5: Int?;
  x6: Bool?;
  x7: Bool?;
  x8: Bool?;
  x9: String?;
  x10: String?;
}

contract ManyOptStruct {
  field: HasManyOptionals;

  init() {
    self.field = HasManyOptionals{
      x1: null, x2: null, x3: null, x4: null, x5: null,
      x6: null, x7: null, x8: null, x9: null, x10: null
    };
  }
}