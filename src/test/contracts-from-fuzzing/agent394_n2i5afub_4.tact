struct Sub {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    s: Sub;

    init() {
        self.s = Sub{
            val: null,
            flag: true
        };
    }
}