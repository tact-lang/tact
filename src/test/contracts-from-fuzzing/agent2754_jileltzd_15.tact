struct Coordinates {
    lat: Int;
    lon: Int;
}

struct AddressStruct {
    street: String;
    coords: Coordinates;
}

contract NestedDefaults {
    addr: AddressStruct;

    init() {
        self.addr = AddressStruct{
            street: "Main",
            coords: Coordinates{
                lat: 100,
                lon:200
            }
        };
    }
}
