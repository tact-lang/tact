struct L4 { a: Int?; b: Bool?; c: String?; }
struct L3 { l4: L4?; d: Int?; }
struct L2 { l3: L3?; e: Int?; }
struct L1 { l2: L2?; f: Int?; }

contract TestContract {
    data: L1;

    init() {
        self.data = L1{
            l2: L2{
                l3: L3{
                    l4: L4{a:null,b:null,c:null},
                    d:null
                },
                e:null
            },
            f:null
        };
    }

    receive() {}
}