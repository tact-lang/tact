struct Layer1 {
  f1: Int;
  f2: Bool?;
}

struct Layer2 {
  l1: Layer1;
  f3: Int;
}

struct Layer3 {
  l2: Layer2;
  f4: Bool;
}

struct Layer4 {
  l3: Layer3;
  f5: Int?;
}

struct Layer5 {
  l4: Layer4;
  f6: Bool;
}

contract DeepLayers {
  deep: Layer5;

  init() {
    self.deep = Layer5{
      l4: Layer4{
        l3: Layer3{
          l2: Layer2{
            l1: Layer1{f1:1,f2:true},
            f3:2
          },
          f4:false
        },
        f5:null
      },
      f6:true
    };
  }
}