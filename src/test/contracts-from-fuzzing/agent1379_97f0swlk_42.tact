struct ManyDefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultsOptStruct {
    f: ManyDefaultOpt;

    init() {
        self.f = ManyDefaultOpt{};
    }
}
