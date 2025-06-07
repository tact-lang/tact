struct OptRemain {
    a: Int?;
    b: Bool?;
    rest: Cell as remaining;
}

contract OptWithRemain {
    data: OptRemain?;

    init() {
        self.data = null;
    }
}