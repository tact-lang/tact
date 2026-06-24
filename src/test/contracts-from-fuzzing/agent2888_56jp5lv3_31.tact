// test minimal nested optional with string
struct Inner {
    s: String?;
}

contract SingleOpt {
    data: Inner?;

    init() {
        self.data = null;
    }
}