struct WrapperString {
    val: String;
}

contract TopOpt {
    field: WrapperString?;

    init() {
        self.field = null;
    }
}