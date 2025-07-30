struct PartialDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String;
    d: Address;
}

contract DefaultPartialTest {
    data: PartialDefaults;

    init() {
        self.data = PartialDefaults{
            a:10,
            b:false,
            c:"xyz",
            d:myAddress()
        };
    }
}
