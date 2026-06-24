struct EmptyOptional {
    content: Int?;
}

contract EmptyOptionalField {
    data: EmptyOptional;

    init() {
        self.data = EmptyOptional{content: null};
    }
}