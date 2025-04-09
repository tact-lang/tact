struct Sub {
    flag: Bool = true;
    text: String = "abc";
    amount: Int = 42;
}

struct Wrapper {
    inner: Sub = Sub{};
    note: String = "done";
}

contract Combo {
    data: Wrapper;
    init() {
        self.data = Wrapper{};
    }
}