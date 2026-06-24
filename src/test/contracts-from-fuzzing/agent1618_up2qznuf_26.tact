struct L3 {
    val: Int = 3;
}

struct L2 {
    l3: L3;
    flag: Bool = true;
}

struct L1 {
    num: Int;
    l2: L2;
}

contract Recursive {
    data: L1;

    init() {
        self.data = L1{
            num: 42,
            l2: L2{
                l3: L3{},
                flag: false
            }
        };
    }
}