struct Point { x: Int; y: Int; }

struct HasOptionalStruct {
    p: Point?;
}

contract OptionalStructField {
    data: HasOptionalStruct;

    init() {
        self.data = HasOptionalStruct{};
    }

    receive() {
        let _ = self.data;
    }
}