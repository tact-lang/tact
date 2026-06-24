struct OptionSer {
    opt: Int? as uint8;
}

contract TestContract {
    s: OptionSer;

    init() {
        self.s = OptionSer{
            opt: null
        };
    }
}