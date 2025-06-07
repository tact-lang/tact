struct Chain1 {
  v1: Int;
}

struct Chain2 {
  v2: Chain1;
}

struct Chain3 {
  v3: Chain2;
}

struct Chain4 {
  v4: Chain3;
}

struct Chain5 {
  v5: Chain4;
}

contract FiveChain {
  ch: Chain5 = Chain5{v5: Chain4{v4: Chain3{v3: Chain2{v2: Chain1{v1: 10}}}}};
}