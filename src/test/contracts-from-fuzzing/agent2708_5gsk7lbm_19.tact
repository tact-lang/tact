struct HasString {
    name: String;
    desc: String;
}

contract Stringy {
    meta: HasString;

    init() {
        self.meta = HasString{
            name: "book", desc: "a very nice book"
        };
    }
}