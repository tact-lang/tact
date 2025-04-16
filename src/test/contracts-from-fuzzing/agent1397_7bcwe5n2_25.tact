struct MultiOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestContract {
    mo: MultiOptional;

    init() {
        self.mo = MultiOptional{
            x: null,
            y: null,
            z: null,
        };
    }

    receive() {
        let _ = self.mo.x;
        let _ = self.mo.y;
        let _ = self.mo.z;
    }
}