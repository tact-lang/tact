struct PrimitiveFields {
    integer: Int;
    boolean: Bool;
    address: Address;
    cell: Cell;
    string: String;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optString: String?;
}

contract TestContract {
    data: PrimitiveFields;

    init() {
        self.data = PrimitiveFields{
            integer: 7,
            boolean: true,
            address: myAddress(),
            cell: emptyCell(),
            string: "hi",
            optInt: null,
            optBool: false,
            optAddress: null,
            optCell: null,
            optString: null
        };
    }
}