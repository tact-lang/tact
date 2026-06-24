struct Mix {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Address;
    e: Bool?;
    f: Int = 42;
}

contract TestContract {
    m: Mix;
    init() {
        self.m = Mix{
            d: myAddress()
        };
    }
    receive() {}
}