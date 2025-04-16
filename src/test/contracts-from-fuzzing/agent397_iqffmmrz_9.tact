struct WrappedString {
    text: String;
}

struct Wrapper {
    w: WrappedString;
    flag: Bool;
}

contract TestContract {
    obj: Wrapper;

    init() {
        self.obj = Wrapper{
            w: WrappedString{ text: "Hello" },
            flag: true
        };
    }
}