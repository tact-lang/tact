struct Details {
    num: Int;
    flag: Bool;
}

message(99) Wrapped {
    info: Details;
    label: String?;
}

contract TestContract {
    data: Wrapped;
    init() {
        self.data = Wrapped{
            info: Details{num: 777, flag: true},
            label: null
        };
    }
}