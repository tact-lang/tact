struct HasString {
    name: String;
    info: String?;
}

contract InfoContract {
    data: HasString;

    init() {
        self.data = HasString{
            name: "Tact",
            info: null
        };
    }
}