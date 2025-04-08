struct Parameterized {
    val: Int;
}

contract OptionalStructInField {
    param: Parameterized?;

    init() {
        self.param = Parameterized{
            val: 555
        };
    }
}
