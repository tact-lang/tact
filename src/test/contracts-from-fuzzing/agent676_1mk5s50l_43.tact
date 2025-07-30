struct StressTest {
  a1: Int; a2: Int?; a3: Int;
  b1: Bool?; b2: Bool; b3: Bool?;
  c1: String; c2: String?; c3: String;
  d1: Int; d2: Int?; d3: Int;
  e1: Bool?; e2: Bool; e3: Bool?;
  f1: String; f2: String?; f3: String;
}

contract StressContract {
  data: StressTest;

  init() {
    self.data = StressTest{
      a1:1,a2:null,a3:3,
      b1:true,b2:false,b3:null,
      c1:"x",c2:null,c3:"y",
      d1:7,d2:null,d3:9,
      e1:null,e2:true,e3:false,
      f1:"foo",f2:"bar",f3:"baz"
    };
  }
}