struct HasCode {
    val: Int;
}

contract InitialWithStruct {
    stuff: HasCode;

    init() {
        self.stuff = HasCode{
            val: 123
        };
    }

    receive() {
        self.stuff = HasCode{
            val: self.stuff.val + 1
        };
    }
}