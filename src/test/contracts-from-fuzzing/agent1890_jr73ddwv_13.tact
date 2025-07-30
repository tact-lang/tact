struct Defaults {
    f1: Int = 1;
    f2: String = "abc";
    f3: Bool = false;
    f4: Bool?; 
}

contract ContractDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{
            f4: null
        };
    }
}