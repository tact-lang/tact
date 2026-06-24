// Struct with many default values and some omitted in initialization
struct Defaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "hi";
    e: Address;
}

contract TestContract {
    df: Defaults;
    init() {
        self.df = Defaults{
            e: myAddress(),
        };
    }
}
