struct InnerOpt { number: Int?; }

contract OptionalStructWithOptField {
    info: InnerOpt?;
    init() {
        self.info = null;
    }
}