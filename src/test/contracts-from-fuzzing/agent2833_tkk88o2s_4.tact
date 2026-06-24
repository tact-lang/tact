struct Mid {
  flag: Bool;
  text: String;
}

struct Outer {
  mid1: Mid;
  mid2: Mid;
  
  optText: String?;
  optFlag: Bool?;
}

contract NestOpt {
  data: Outer;

  init() {
    self.data = Outer{
      mid1: Mid{ flag:true, text:"hi" },
      mid2: Mid{ flag:false, text:"hello" },
      optText: null,
      optFlag: null
    };
  }
}