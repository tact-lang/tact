struct OptNest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: OptNest = OptNest{};

    init() {
        self.data = OptNest{
            x: 10,
            y: true,
            z: "hello"
        };
    }

    receive() {
        let xv = self.data.x == null ? 0 : self.data.x!!;
        let yv = self.data.y == null ? false : self.data.y!!;
        let _ = xv + (yv ? 1 : 0);
    }
}