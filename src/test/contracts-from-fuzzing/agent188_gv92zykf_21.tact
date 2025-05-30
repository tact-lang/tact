struct OptStruct {
    val: Int?;
}

contract OptionalInit {
    s: OptStruct?;
    init() {
        self.s = OptStruct{
            val: 1
        };
    }
}
