struct Container {
    one: Int;
    two: Bool;
    three: String;
    four: Cell;
    five: Address;
    six: Slice;
    seven: Builder;
}

contract TestContract {
    item: Container;

    init() {
        self.item = Container{
            one:1, two:true, three:"hi", four:emptyCell(),
            five:myAddress(), six:emptyCell().asSlice(), seven:beginCell()
        };
    }
}