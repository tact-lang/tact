struct Containers {
    address: Address;
    slice: Slice;
    cell: Cell;
}

contract PrimitivesContainerTest {
    data: Containers;

    init() {
        self.data = Containers{
            address: myAddress(),
            slice: emptyCell().asSlice(),
            cell: emptyCell()
        };
    }
}