struct Deep {
    inner: Inner;
    optional_inner: Inner?;
}

struct Inner {
    int_field: Int;
    bool_field: Bool;
    string_field: String;
    address_field: Address;
    cell_field: Cell;
    slice_field: Slice;
    optional_int: Int?;
    optional_bool: Bool?;
    optional_slice: Slice?;
    optional_address: Address?;
    optional_string: String?;
}

contract DeepStorage {
    nested: Deep = Deep{
        inner: Inner{
            int_field: 0,
            bool_field: false,
            string_field: "",
            address_field: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            cell_field: cell("te6cckEBAQEAAgAAAEysuc0="),
            slice_field: slice("te6cckEBAQEAAgAAAEysuc0="),
            optional_int: null,
            optional_bool: null,
            optional_slice: null,
            optional_address: null,
            optional_string: null,
        },
        optional_inner: null,
    };

    init() {}
}
