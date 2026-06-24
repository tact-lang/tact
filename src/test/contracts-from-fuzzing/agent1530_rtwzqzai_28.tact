struct Sub {
    x: Int = 7;
    y: String = "x";
}

contract TestContract {
    num: Int = 1;
    sub: Sub = Sub{};
    optNum: Int? = null;
    optSub: Sub? = null;

    init() {
        // rely only on defaults
    }
}
