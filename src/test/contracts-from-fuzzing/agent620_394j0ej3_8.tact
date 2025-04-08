struct DiverseOptional {
    i: Int?;
    b: Bool?;
    addr: Address?;
}

contract TestContract {
    data: DiverseOptional;

    init() {
        self.data = DiverseOptional{
            i: null,
            b: null,
            addr: null
        };
    }

    receive() {
        if (self.data.i != null) {
            let _ = self.data.i!!;
        }
        if (self.data.b != null) {
            let _ = self.data.b!!;
        }
        if (self.data.addr != null) {
            let _ = self.data.addr!!;
        }
    }
}