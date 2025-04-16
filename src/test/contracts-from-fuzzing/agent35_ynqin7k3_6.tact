struct Sub {
  item1: Int;
  item2: Bool;
}

struct Mid {
  sub1: Sub;
  sub2: Sub;
}

struct Top {
  midA: Mid;
  midB: Mid;
}

contract DeepStruct {
  data: Top;

  init() {
    self.data = Top{
      midA: Mid{
        sub1: Sub{item1:1,item2:true},
        sub2: Sub{item1:2,item2:false}
      },
      midB: Mid{
        sub1: Sub{item1:3,item2:true},
        sub2: Sub{item1:4,item2:false}
      }
    };
  }
}