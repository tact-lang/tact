struct Coordinates {
  lat: Int;
  lon: Int;
}

struct AddressStruct {
  name: String;
  coords: Coordinates?;
}

contract OptionalNestedStruct {
  addr: AddressStruct = AddressStruct{
    name: "Home"
  };
}