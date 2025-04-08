struct InnerString {
    text: String = "Escapes: \" \\ \n and emoji 😎";
}

struct Wrapper {
    inner: InnerString;
    num: Int;
}

contract NestedEscapes {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: InnerString{},
            num: 99
        };
    }
}