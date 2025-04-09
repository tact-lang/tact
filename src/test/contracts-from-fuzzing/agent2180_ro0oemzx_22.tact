struct Sub {
    n: Int;
}

struct DirectDefaults {
    s: Sub = Sub{ n: 10 };
}

contract InnerDefaults {
    obj: DirectDefaults;

    init() {
        self.obj = DirectDefaults{};
    }
}