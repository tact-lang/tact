// Struct with explicit serialization and defaults
struct SerDef {
    x: Int as uint64 = 5;
    y: Bool = true;
}

contract SerialDefault {
    sd: SerDef = SerDef{};
}