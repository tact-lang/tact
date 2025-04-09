struct Defaults {
    a: Int = 1;
    b: String = "hi";
    c: Bool = false;
    d: Int?;
}

contract DefaultsContract {
    data: Defaults;

    init() {
        self.data = Defaults{ d: null };
    }
}