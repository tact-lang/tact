struct Defaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "hi";
}

contract DefaultsStorage {
    val: Defaults = Defaults{};
}