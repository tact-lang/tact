struct Coord {
    lat: Int;
    lon: Int;
}

struct Delivery {
    address: String;
    coords: Coord? = null;
}

contract DefaultOptionalField {
    item: Delivery;

    init() {
        self.item = Delivery{
            address: "somewhere"
        };
    }
}
