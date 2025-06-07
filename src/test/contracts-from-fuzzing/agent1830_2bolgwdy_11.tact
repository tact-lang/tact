struct EmptyStringDefault {
    s: String = "";
}

contract TestContract {
    data: EmptyStringDefault;

    init() {
        self.data = EmptyStringDefault{
            s: ""
        };
    }
}
