struct Mix {
    s: String = "hello";
    addr: Address?;
}

contract StructDefaults {
    var: Mix;

    init() {
        self.var = Mix{
            addr: null
        };
    }
}