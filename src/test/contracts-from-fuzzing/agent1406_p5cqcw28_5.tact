struct Info {
    id: Int;
    label: String;
}

contract Optionals {
    data: Info?;  // optional struct
    flag: Bool;   // plus a normal var to distinguish

    init() {
        self.flag = true;
    }
}