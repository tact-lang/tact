struct OptsMany {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: String?;
}

contract TestContract {
    data: OptsMany;

    init() {
        self.data = OptsMany{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null
        };
    }
}