struct L3 {
    a: Int? as int64;
    b: Bool?;
}

struct L2 {
    l3: L3;
    s: String?; 
}

struct L1 {
    x: Int as uint32;
    l2: L2;
}

contract TestContract {
    store: L1;

    init() {
        self.store = L1{
            x: 42,
            l2: L2{
                l3: L3{a: null, b: true},
                s: "ok"
            }
        };
    }
}