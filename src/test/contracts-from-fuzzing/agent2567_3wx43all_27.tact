struct Parameterized {
  val1: Int as int1;
  val2: Int as uint1;
  val3: Int as int257;
  val4: Int as uint256;
}

contract EdgeSerialization {
  state: Parameterized;
    init() {
        self.state = Parameterized{
            val1:0, val2:0, val3:0, val4:0
        };
    }
}