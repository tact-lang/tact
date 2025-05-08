struct InnerOptional {
    val: Int?;
}

contract TestContract {
    field: InnerOptional;

    init() {
        self.field = InnerOptional{ val: null };
    }
}