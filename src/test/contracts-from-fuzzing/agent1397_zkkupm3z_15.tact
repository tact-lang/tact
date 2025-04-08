struct DefaultsAndNulls {
    initInt: Int = 42;
    optStr: String?;
    hasFlag: Bool = true;
    optInt: Int?;
}

contract DnN {
    val: DefaultsAndNulls;

    init() {
        self.val = DefaultsAndNulls{};
    }
}