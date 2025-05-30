// Testing struct default values and partial init
struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Address;
}

contract PartialInit {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{
            d: myAddress()
        };
    }
}