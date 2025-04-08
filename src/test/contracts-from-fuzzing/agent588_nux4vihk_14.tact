struct OptsOnly {
    x: Int?;
    y: Int?;
    z: String?;
    f: Bool?;
}

contract TopOptStruct {
    state: OptsOnly?;

    init() {
        self.state = OptsOnly{ x: null, y: null, z: null, f: true };
    }

    receive() {
        if (self.state != null && self.state!!.f != null) {
            let _ = self.state!!.f!!;
        }
    }
}