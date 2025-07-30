struct Params {
    text: String = "hey";
    num: Int?;
}

contract DefaultAndNull {
    val: Params;
    init() {
        self.val = Params {
            num: null
        };
    }
}
