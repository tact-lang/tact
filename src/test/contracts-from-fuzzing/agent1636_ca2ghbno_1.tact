contract TestContract {
    counter: Int;
    flag: Bool;
    owner: Address;

    init() {
        self.counter = 0;
        self.flag = true;
        self.owner = myAddress();
    }
}
