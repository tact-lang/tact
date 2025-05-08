struct OptionalHolder {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptsContract {
    field: OptionalHolder;

    init() {
        self.field = OptionalHolder{
            x: null,
            y: true,
            z: null,
        };
    }
}