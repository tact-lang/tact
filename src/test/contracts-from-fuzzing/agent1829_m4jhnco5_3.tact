struct Data { x: Int; y: Int; }

contract TestContract {
    optData: Data?;

    init() {
        self.optData = null;
    }
}