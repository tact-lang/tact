struct MultiType {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
}

contract TestContract {
    data: MultiType;

    init() {
        self.data = MultiType{
            a:5, b:"abc", c:true, d: myAddress(), e: emptyCell()
        };
    }
}