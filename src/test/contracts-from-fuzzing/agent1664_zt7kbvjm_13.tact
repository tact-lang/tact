struct PartialOpts {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract PartialNullStruct {
    ps: PartialOpts;

    init() {
        self.ps = PartialOpts{
            x: 42,
            y: null,
            z: "zzz"
        };
    }
}