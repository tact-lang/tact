struct Complex {
    val1: Int;
    val2: Bool;
    text: String;
    slice: Slice;
    cell: Cell;
    address: Address;
    flag: Bool?;
    amount: Int?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            val1: 1,
            val2: false,
            text: "hello",
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            address: myAddress(),
            flag: null,
            amount: null,
        };
    }
}