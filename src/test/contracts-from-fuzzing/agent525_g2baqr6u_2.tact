struct Coord {
    lat: Int;
    lng: Int;
}

struct AddressData {
    street: String;
    zip: Int as uint32;
    location: Coord;
    description: String?;
}

contract Test {
    addr: AddressData;

    init() {
        self.addr = AddressData{
            street: "Main",
            zip: 12345,
            location: Coord{ lat: 5, lng: 10 },
            description: null
        };
    }
}