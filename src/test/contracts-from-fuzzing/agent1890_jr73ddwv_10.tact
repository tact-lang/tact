struct OptNested {
    nest: Int?;
}

contract OptInitDefault {
    f: OptNested;

    init() {
        self.f = OptNested{
            nest: null
        };
    }
}