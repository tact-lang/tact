struct Mid {
  a: Int;
  b: Int?;
  c: Bool;
}

struct Container {
  m1: Mid;
  m2: Mid;
  m3: Mid;
}

contract TestContract {
    stored: Container;

    init() {
        self.stored = Container{
            m1: Mid{ a:1, b:null, c:false },
            m2: Mid{ a:2, b:3, c:true },
            m3: Mid{ a:4, b:null, c:true },
        };
    }
}