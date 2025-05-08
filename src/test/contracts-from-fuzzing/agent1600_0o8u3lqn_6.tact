struct OptOptOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsContract {
    opt: OptOptOpt;

    init() {
        self.opt = OptOptOpt{x: null, y: null, z: null};
    }
}