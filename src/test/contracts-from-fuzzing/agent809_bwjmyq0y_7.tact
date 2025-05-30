struct FlatContractData {
    x: Int;
    y: Bool;
    z: Int?;
}

contract DefaultsContract {
    data: FlatContractData = FlatContractData{ x: 1, y: true, z: null };

    init() {
        self.data = FlatContractData{ x: 10, y: false, z: null };
    }
}