struct OptionalLots {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
    o5: Address?;
    o6: Cell?;
}

contract TestContract {
    lots: OptionalLots;

    init() {
        self.lots = OptionalLots{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
    }
}
