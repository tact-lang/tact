struct Nested {
    one: Int;
    two: Bool;
    three: Address;
    four: Cell;
}

contract TestContract {
    field1: Nested;
    field2: Nested;
    field3: Nested;
    
    init() {
        self.field1 = Nested{ one:1, two:true, three:myAddress(), four:emptyCell() };
        self.field2 = self.field1;
        self.field3 = self.field1;
    }
}