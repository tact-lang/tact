struct Mega {
    a: Int;
    e: Cell;
}

contract InitAssignContract {
    bag: Mega;

    init() {
        self.bag = Mega{
            a: 5,
            e: emptyCell()
        };
    }
}