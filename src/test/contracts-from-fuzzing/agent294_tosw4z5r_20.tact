struct Sub {
    text: String = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
}

struct Container {
    s: Sub = Sub{};
    num: Int = 7;
}

contract LongStringDefault {
    c: Container;

    init() {
        self.c = Container{};
    }
}
