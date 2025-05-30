struct WithString {
    msg: String;
}

contract StringInStruct {
    s: WithString;

    init() {
        self.s = WithString{
            msg: "hello, world!"
        };
    }
}