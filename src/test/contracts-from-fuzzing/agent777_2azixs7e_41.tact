struct AltOptBool {
    a: Bool?;
    b: Bool;
    c: Bool?;
    d: Bool;
    e: Bool?;
}

contract AltOptBoolTest {
    store: AltOptBool;

    init() {
        self.store = AltOptBool{
            a: null,
            b: true,
            c: false,
            d: false,
            e: null
        };
    }
}