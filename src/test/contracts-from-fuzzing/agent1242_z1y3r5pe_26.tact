// optional within struct with default omitted
struct DefOpt {
    x: Int?;
    y: Bool?;

}

contract Test {
    s: DefOpt;

    init() {
        self.s = DefOpt{ x: null, y: null };
    }
}
