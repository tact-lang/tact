struct Params {
    ready: Bool = false;
    message: String = "";
    maybeVal: Int?;
}

contract DefaultsOptional {
    p: Params;

    init() {
        self.p = Params{};
    }
}
