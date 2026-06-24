struct Params {
    x: Int = 10;
    y: Int? = null;
    z: Bool = true;
}

contract TestContract {
    data: Params;

    init() {
        self.data = Params { x: 5, y: null, z: false };
    }
}