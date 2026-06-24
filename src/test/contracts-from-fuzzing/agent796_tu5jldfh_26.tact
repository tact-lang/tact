// Message containing nested struct w/optionals and defaults
struct Meta {
    info: String?;
    code: Int = 42;
}

message(1234) ComplexMsg {
    m: Meta?;
    flag: Bool;
}

contract TestContract {
    val: ComplexMsg;

    init() {
        self.val = ComplexMsg{
            m: null,
            flag: true
        };
    }
}