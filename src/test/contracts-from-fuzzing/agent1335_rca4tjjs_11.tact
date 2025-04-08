struct Sub {
    v: Int = 99;
}

struct Main {
    sub: Sub = Sub{};
    flag: Bool = false;
}

contract DefaultedNested {
    data: Main;
    init() {
        self.data = Main{};
    }
    receive() {}
}