struct Defaulted {
    x: Int = 10;
    y: String = "hello";
    z: Bool?; // defaults to null
}

contract TestContract {
    v: Defaulted = Defaulted{};
}