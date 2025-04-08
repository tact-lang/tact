contract DefaultsInContract {
    a: Int = 5;
    b: Bool = true;
    c: String = "ok";
    d: Address;

    init() {
        self.d = myAddress();
    }
}