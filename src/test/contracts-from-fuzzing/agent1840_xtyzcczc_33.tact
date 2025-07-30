struct STRDefault {
    s: String = "default meow";
}

contract CatStr {
    cat: STRDefault;

    init() {
        self.cat = STRDefault{};
    }
}