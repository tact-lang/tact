struct EmptyStringStruct {
    s: String;
}

contract TestContract {
    data: EmptyStringStruct;

    init() {
        self.data = EmptyStringStruct{
            s: ""
        };
    }
}
