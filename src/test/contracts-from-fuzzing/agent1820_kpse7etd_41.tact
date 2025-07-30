struct FourLevels {
    lev1: Int;
    lev2: Int?;
    lev3: Bool;
    lev4: Bool?;
}

contract TestContract {
    field: FourLevels;
    init() {
        self.field = FourLevels{
            lev1: 5,
            lev2: null,
            lev3: true,
            lev4: null,
        };
    }
}