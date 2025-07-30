// persist opt fields w/o init, expect accept as null default applies
contract Test {
    x: Int?;
    y: String?;
    z: Bool?;

    init() {
        // omit assignment
    }
}