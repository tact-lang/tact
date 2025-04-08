struct DeepNulls {
    x: Int?;
    y: Int?;
    txt: String?;
    flag: Bool?;
    addr: Address?;
}

contract DefaultAllNullOptionals {
    store: DeepNulls;

    init() {
        self.store = DeepNulls{};  // all optionals at their default (null)
    }
}