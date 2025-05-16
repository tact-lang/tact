struct Big {
  one: Int;
  two: Int;
  three: Int;
  four: Int;
  five: Int;
  six: Int;
  seven: Int;
  eight: Int;
  nine: Int;
  ten: Int;
}

contract ManyBigStructs {
  field1: Big;
  field2: Big;
  field3: Big;

  init() {
    self.field1 = Big{one:1,two:2,three:3,four:4,five:5,six:6,seven:7,eight:8,nine:9,ten:10};
    self.field2 = self.field1;
    self.field3 = self.field1;
  }
}