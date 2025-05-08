struct SOpt { x: Int?; y: Bool? }

contract TestContract {
    optData: SOpt;

    init() {
        self.optData = SOpt{ x: null, y: true };
    }
}