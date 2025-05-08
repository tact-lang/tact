struct AA {
 a: Int;
}

struct BB {
 b: AA;
}

struct CC {
 c: BB;
}

contract DeepStructAssign {
 d: CC;
 init() {
  self.d = CC{ c: BB{ b: AA{ a:34 } } };
 }
}