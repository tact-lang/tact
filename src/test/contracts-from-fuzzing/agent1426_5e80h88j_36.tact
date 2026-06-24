// Contract field with fixed Int, a String, and multiple optionals for balance test
contract MixedFields {
    amount: Int as coins;
    note: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;

    init() {
        self.amount = 1000;
        self.note = "payment";
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
    }
}