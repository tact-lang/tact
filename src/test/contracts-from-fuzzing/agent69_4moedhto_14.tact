struct MixedDefaultsOptionals {
    a: Int = 1;
    b: String? = null;
    c: Bool = false;
    d: Int? = null;
    e: Address;
}

contract MixedDefaultsOptionalsTest {
    data: MixedDefaultsOptionals;

    init() {
        self.data = MixedDefaultsOptionals{
            e: myAddress()
        };
    }
}