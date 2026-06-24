struct Defaulted {
    f1: Int = 42;
    f2: Bool?;
    f3: String = "lol";
    f4: Bool = true;
    f5: Address;
}

contract Defaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{
            f2: null,
            f5: myAddress()
        };
    }
}