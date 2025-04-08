struct Layer3 {
    flag: Bool;
    info: String;
}

struct Layer2 {
    deep: Layer3;
    note: String = "";
}

struct Layer1 {
    nested: Layer2;
}

contract NestedInits {
    data: Layer1 = Layer1{ nested: Layer2{ deep: Layer3{ flag: false, info: "" } } };
}