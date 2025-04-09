struct EmptyStrHolder {
    s: String;
}

contract EmptyStringField {
    field: EmptyStrHolder;

    init() {
        self.field = EmptyStrHolder{
            s: ""
        };
    }
}