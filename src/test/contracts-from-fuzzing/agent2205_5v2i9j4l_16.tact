struct Coordinates {
    lat: Int as int64;
    long: Int as int64;
}

struct AddressStruct {
    city: String;
    coords: Coordinates;
}

contract NestedStructDefaults {
    addr: AddressStruct;

    init() {
        self.addr = AddressStruct{
            city: "Metropolis",
            coords: Coordinates{ lat: 50, long: 30 }
        };
    }
}