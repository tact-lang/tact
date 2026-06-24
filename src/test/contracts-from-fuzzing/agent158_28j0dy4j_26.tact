struct Leaf {
  n: Int;
  m: String?
}
struct Branch {
  l: Leaf;
  f: Bool;
}
struct Root {
  left: Branch;
  right: Branch;
}

contract TreeContract {
    t: Root;
    init() {
        self.t = Root{
            left: Branch{ l: Leaf{n:1, m:"hi"}, f:true },
            right: Branch{ l: Leaf{n:2, m:null}, f:false}
        };
    }
}