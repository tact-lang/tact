struct NestOpt {
    l1: L1?;
}

struct L1 {
    l2: L2?;
}

struct L2 {
    l3: L3?;
}

struct L3 {
    l4: L4?;
}

struct L4 {
    l5: L5?;
}

struct L5 {
    value: Int?;
}

contract TestContract {
    data: NestOpt;

    init() {
        self.data = NestOpt{ l1: null };
    }
}