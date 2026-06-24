struct L3 { val: Int?; }

struct L2 { nested: L3; num: Int; }

struct L1 { nested: L2; flag: Bool; }

contract TestContract {
    data: L1;

    init() {
        self.data = L1{
            nested: L2{
                nested: L3{ val: null },
                num: 123
            },
            flag: true
        };
    }
}