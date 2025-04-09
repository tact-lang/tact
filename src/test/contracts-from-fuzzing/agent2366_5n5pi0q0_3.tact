struct MultiOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    opts: MultiOptionals;

    init() {
        self.opts = MultiOptionals{x: null, y: true, z: null};
    }
}