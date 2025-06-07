struct EmptyOptionalHolder {
    val1: Int?;
    val2: Bool?;
}

contract OptionalInit {
    holder: EmptyOptionalHolder;

    init() {
        self.holder = EmptyOptionalHolder{
            val1: null,
            val2: null
        };
    }
}