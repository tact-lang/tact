struct OptionalStruct {
    m: Int?;
    n: Bool?;
    s: String?;
}

contract OptStructContract {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}