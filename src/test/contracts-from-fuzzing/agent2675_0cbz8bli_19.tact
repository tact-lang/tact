struct L3 {
    n: Int = 100;
    t: String = "x";
}

struct L2 {
    sm: L3;
    flag: Bool = true;
}

struct L1 {
    s: L2;
}

contract PartialDefaults {
    data: L1;

    init() {
        self.data = L1{
            s: L2{
                sm: L3{}
            }
        };
    }
}