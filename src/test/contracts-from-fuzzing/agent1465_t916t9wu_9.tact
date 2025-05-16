struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Address;
}

contract StructDefaultTest {
    val: Defaults;

    init() {
        self.val = Defaults{
            d: myAddress()
        };
    }
}