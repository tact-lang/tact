struct Layered {
    dep1: Int as int64;
    dep2: Int as uint8;
    dep3: Bool;
    dep4: String?;
    dep5: Int?;
}

contract LayeredStructContract {
    s: Layered;

    init() {
        self.s = Layered{
            dep1: 111,
            dep2: 12,
            dep3: true,
            dep4: null,
            dep5: 99
        };
    }
}