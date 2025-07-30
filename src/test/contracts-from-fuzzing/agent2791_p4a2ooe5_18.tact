struct EmptyOptional {
    val: Int?;
}

contract OptNull {
    optVal: EmptyOptional;

    init() {
        self.optVal = EmptyOptional{
            val: null,
        };
    }
}
