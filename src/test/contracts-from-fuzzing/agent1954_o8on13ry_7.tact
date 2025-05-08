struct OptionalStructField {
    x: Int;
}

struct OptionalHolder {
    s: OptionalStructField?;
}

contract OptionalStructRef {
    data: OptionalHolder;

    init() {
        self.data = OptionalHolder{
            s: null,
        };
    }
}
