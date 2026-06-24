// Empty struct usage is forbidden by known issues list, test struct with only one field and optional contract var
struct SoloField {
    value: Int;
}

contract OptSoloField {
    rec: SoloField?;

    init() {
        self.rec = null;
    }
}