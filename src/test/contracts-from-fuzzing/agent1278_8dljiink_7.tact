struct Inner {
    flag: Bool?;
    text: String?;
}

struct Wrapper {
    maybeInner: Inner?;
}

contract TestContract {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            maybeInner: Inner{
                flag: true,
                text: "hi",
            }
        };
    }
}