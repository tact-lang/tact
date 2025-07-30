struct Data {
    x: Int = 10;
    y: Bool = true;
    z: Bool?;
}

contract DefaultsAndNulls {
    d: Data;

    init() {
        self.d = Data{}; // will use defaults + null
    }
}