struct OptBoolWrap {
    a: Bool?;
    b: Bool?;
}

contract ManyOptBool {
    val: OptBoolWrap;

    init() {
        self.val = OptBoolWrap{
            a: null,
            b: null
        };
    }
}