struct OptStruct {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    v4: Address?;
    v5: Cell?;
    v6: Slice?;
}

contract TestContract {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}