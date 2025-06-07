struct OptionalsWithDefaults {
    o1: Int? = null;
    o2: Bool? = null;
    o3: Cell? = null;
}

contract TestContract {
    data: OptionalsWithDefaults;

    init() {
        self.data = OptionalsWithDefaults{
            o1:null, o2:null, o3:null
        };
    }
}
