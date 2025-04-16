struct HasNullOpt {
    a: Int? = null;
}

contract InitNullOptional {
    f: HasNullOpt;

    init() {
        self.f = HasNullOpt{};
    }
}