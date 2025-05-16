struct ComplexFields {
    simple_int: Int;
    int_small: Int as uint8;
    large_int: Int as int257;
    some_bool: Bool;
    a_string: String;
    opt_int: Int?;
    opt_bool: Bool?;
    a_cell: Cell;
    an_addr: Address;
}

contract ComplexFieldsTest {
    data: ComplexFields;

    init() {
        self.data = ComplexFields{
            simple_int: 1,
            int_small: 2,
            large_int: 3,
            some_bool: true,
            a_string: "hi",
            opt_int: 5,
            opt_bool: false,
            a_cell: emptyCell(),
            an_addr: myAddress(),
        };
    }
}
