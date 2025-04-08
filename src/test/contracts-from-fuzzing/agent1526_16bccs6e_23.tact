struct BoolWrap { flag: Bool; }

contract OptBoolStruct {
    st: BoolWrap?;

    init() {
        self.st = null;
    }
}