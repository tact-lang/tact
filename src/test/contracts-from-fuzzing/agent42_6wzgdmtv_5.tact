struct Param {
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

contract TestContract {
  params: Param;

  init() {
    self.params = Param{
      one:1,two:2,three:3,four:4,five:5,six:6,seven:7,eight:8,nine:9,ten:10
    };
  }
}