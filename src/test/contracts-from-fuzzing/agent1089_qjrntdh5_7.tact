struct Mix {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract StorageMix {
    mix: Mix = Mix{};
}