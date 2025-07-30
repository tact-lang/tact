struct AnnotOpt {
    small: Int? as uint8;
}

contract AnnotOptField {
    data: AnnotOpt;

    init() {
        self.data = AnnotOpt{
            small: 123,
        };
    }
}