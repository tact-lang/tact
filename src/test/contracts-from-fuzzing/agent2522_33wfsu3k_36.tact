contract MixedFields {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: Int? = null;
    e: Bool? = null;
    f: String = "hi";

    init() {
        self.c = myAddress();
    }
}