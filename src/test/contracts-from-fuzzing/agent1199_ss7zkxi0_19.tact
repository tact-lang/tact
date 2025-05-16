struct ManyOptFlags {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
    f7: Bool?;
    f8: Bool?;
    f9: Bool?;
    f10: Bool?;
}

contract TestContract {
    data: ManyOptFlags;

    init() {
        self.data = ManyOptFlags{
            f1: null,
            f2: true,
            f3: null,
            f4: false,
            f5: null,
            f6: true,
            f7: null,
            f8: false,
            f9: true,
            f10: null
        };
    }
}