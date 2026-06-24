contract TestContract {
    flag: Bool; 
    count: Int;
    balance: Int as coins;
    owner: Address;
    data: Cell;
    info: Slice;
    name: String;

    init() {
        self.flag = true;
        self.count = 0;
        self.balance = ton("1");
        self.owner = myAddress();
        self.data = emptyCell();
        self.info = emptyCell().asSlice();
        self.name = "Test";
    }

    receive() {
        // Dummy usage
        self.count += 1;
    }
}