// persistent optional struct, with nested struct inside optional field
struct Info {
    txt: String = "-";
    num: Int = 0;
}

contract OptStructField {
    info: Info?;

    receive() {
        self.info = Info{
            txt: "abc",
            num: 42,
        };
    }
}