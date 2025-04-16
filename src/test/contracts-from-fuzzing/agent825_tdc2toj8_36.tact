// Test contract with nested struct with defaulted optional inside contract variables
struct DD {
    x: Int? = null;
}

contract OptStructInCt {
    my: DD = DD{};
}