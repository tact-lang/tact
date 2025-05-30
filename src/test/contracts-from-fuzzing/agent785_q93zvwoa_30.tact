struct Inside {
    amount: Int;
    note: String;
}

contract OptStructInMiddle {
    head: Int;
    middle: Inside?;
    tail: String;

    init() {
        self.head = 5;
        self.middle = null;
        self.tail = "done";
    }
}