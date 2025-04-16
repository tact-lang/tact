struct Compose {
    intField: Int;
    maybeInt: Int?;
    boolField: Bool;
    maybeBool: Bool?;
    strField: String;
    maybeStr: String?;
}

contract ComposeMix {
    data: Compose;

    init() {
        self.data = Compose{
            intField: 1,
            maybeInt: 2,
            boolField: true,
            maybeBool: false,
            strField: "fixed",
            maybeStr: null
        };
    }
}