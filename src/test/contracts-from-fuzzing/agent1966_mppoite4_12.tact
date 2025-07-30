struct WithString {
    data: String;
}

contract StringPersistence {
    field: WithString;

    init() {
        self.field = WithString{
            data: "Stored permanently"
        };
    }
}