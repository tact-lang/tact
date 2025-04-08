struct L5 { val5: Int; }
struct L4 { l5: L5?; txt: String = "L4"; }
struct L3 { l4: L4?; flag: Bool = false; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; count: Int?; }

contract TestContract {
    deep: L1? = null;

    init() {
        self.deep = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        l5: L5{ val5: 777 },
                        txt: "deep",
                    },
                    flag: true
                }
            },
            count: 42
        };
    }
}