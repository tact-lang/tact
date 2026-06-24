struct Sub {
    val: Int;
}

contract OptInStruct {
    s: Sub?;

    init() {
        self.s = Sub{
            val: 999,
        };
    }
}
