struct Layer1 {
    f1: Int;
    l2: Layer2;
}

struct Layer2 {
    f2: String;
    l3: Layer3;
}

struct Layer3 {
    f3: Bool;
    l4: Layer4;
}

struct Layer4 {
    f4: Int?;
}

contract Layers {
    core: Layer1;

    init() {
      self.core = Layer1{
        f1:7, l2:Layer2{f2:"x", l3:Layer3{f3:false, l4:Layer4{f4:null}}}
      };
    }
}