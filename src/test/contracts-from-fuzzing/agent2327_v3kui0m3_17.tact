struct DefaultsCombined {
    f1: Int = 0;
    f2: Bool = false;
    f3: String = "";
    f4: Address;
    f5: Int? = null;
}

contract TestDefComb {
    s: DefaultsCombined;

    init() {
        self.s = DefaultsCombined{
            f4: myAddress()
        };
    }
}
