struct OptionalNest {
    child: Int?;
}

contract OptionalInOptional {
    data: OptionalNest?;

    init() {
        self.data = null;
    }
}