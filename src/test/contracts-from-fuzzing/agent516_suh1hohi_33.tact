struct StringOpt {
    text: String?;
    val: Int;
}

contract StringOptional {
    data: StringOpt;

    init() {
        self.data = StringOpt{
            text: null,
            val: 5
        };
    }
}
