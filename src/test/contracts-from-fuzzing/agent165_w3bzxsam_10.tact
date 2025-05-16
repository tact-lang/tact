struct Coordinates {
    latitude: Int; 
    longitude: Int;
}

struct AddressData {
    city: String; 
    country: String; 
    coords: Coordinates;
}

contract LocationHolder {
    addressInfo: AddressData;

    init() {
        self.addressInfo = AddressData{
            city: "Moon", 
            country: "Space",
            coords: Coordinates{ latitude: 123, longitude: 456 }
        };
    }
}