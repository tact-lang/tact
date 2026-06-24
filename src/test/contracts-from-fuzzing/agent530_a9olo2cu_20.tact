struct OptionalDeep {
    aa: Int?;
    bb: Bool?;
    cc: String?;
}

struct L1 {
    nest: OptionalDeep?;
}

struct L2 {
    nest: L1?;
}

contract NestedOptionals {
    data: L2;

    init() {
        self.data = L2{
            nest: L1{
                nest: OptionalDeep{
                    aa:null, bb:true, cc:null
                }
            }
        };
    }
}
