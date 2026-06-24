struct Medium {
    x: Int;
    y: String;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    f3: String?;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Medium;
    
    init() {
        self.f1 = 10;
        self.f2 = false;
        self.f3 = null;
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = Medium{ x:1, y:"y" };
    }
}