struct DefaultOpt {
    foo: Int = 10;
    bar: String?;
}

contract StructDefaultOpt {
    val: DefaultOpt;
    init() {
        self.val = DefaultOpt{
            foo: 20,
            bar: null
        };
    }
}