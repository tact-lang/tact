struct Coordinates {
  lat: Int = 0;
  lon: Int = 0;
}

struct AddressStruct {
  street: String = "";
  postcode: Int = 0;
  coords: Coordinates = Coordinates{};
}

contract NestedDefaultStruct {
  addr: AddressStruct = AddressStruct{};
}