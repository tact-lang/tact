struct InnerOption { val: Int?; }

contract PartialOption {
    s: InnerOption;

    init() {
        self.s = InnerOption{ val: null };
    }
}