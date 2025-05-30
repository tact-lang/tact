struct Zeroes {
    i: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract ZeroDefaultsStruct {
    z: Zeroes;

    init() {
        self.z = Zeroes{};
    }
}