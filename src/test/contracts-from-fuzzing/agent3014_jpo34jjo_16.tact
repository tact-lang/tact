struct RemainX {
   big: Cell as remaining;
}

contract TestContract {
    field: RemainX;

    init() {
        self.field = RemainX{
            big: emptyCell(),
        };
    }
}