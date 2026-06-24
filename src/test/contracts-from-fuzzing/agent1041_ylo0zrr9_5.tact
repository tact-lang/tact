struct OwnerData {
    id: Int;
    name: String;
}

contract MultipleFields {
    owner: OwnerData;
    counter: Int;
    isActive: Bool;
    description: String;
    timestamp: Int;

    init() {
        self.owner = OwnerData{ id: 1, name: "bob" };
        self.counter = 0;
        self.isActive = true;
        self.description = "testing";
        self.timestamp = 999999;
    }
}
