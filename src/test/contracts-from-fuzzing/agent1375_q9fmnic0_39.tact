struct FullyDefaulted {
    x: Int = 5;
    y: Bool = true;
}

contract PersistentWithDefault {
    data: FullyDefaulted = FullyDefaulted{};

    init() {
        // no need to assign data again
    }
}