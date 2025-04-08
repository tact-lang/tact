struct Chain1 {
  next: Chain2;
}

struct Chain2 {
  next: Chain3;
}

struct Chain3 {
  next: Chain4;
}

struct Chain4 {
  next: Chain5;
}

struct Chain5 {
  x: Int?;
  b: Bool;
}

contract DeepChain {
    c: Chain1;

    init() {
        self.c = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        next: Chain5{
                            x: null,
                            b: true
                        }
                    }
                }
            }
        };
    }
}