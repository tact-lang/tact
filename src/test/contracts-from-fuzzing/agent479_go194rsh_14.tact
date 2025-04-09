struct X { v: Int }

contract OptionalStructFromStart {
    data: X?;

    init() {
        self.data = null;
    }
}