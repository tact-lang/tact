struct InnerDefaults {
    x: Int = 7;
    y: Bool = true;
    z: Int? = null;
}

struct OuterDefaults {
    inn: InnerDefaults = InnerDefaults{};
    name: String = "name";
}

contract NestedDefaultsCtr {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{};
    }
}