struct NestedOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract PersistOptionals {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            i: null,
            b: true,
            s: null,
        };
    }
}