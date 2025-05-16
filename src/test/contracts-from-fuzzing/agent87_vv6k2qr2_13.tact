struct HasString {
    s: String;
}

struct Wrapper {
    inner: HasString;
}

contract StringInStorage {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: HasString{
                s: "test"
            }
        };
    }
}
