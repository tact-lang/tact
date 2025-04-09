struct ContainsOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract InitNullOptionals {
    data: ContainsOptionals;
    init() {
        self.data = ContainsOptionals{ opt1: null, opt2: null, opt3: null };
    }
}