struct Nested {
    subfield1: Int?;
    subfield2: Bool;
}

contract TestContract {
    data: Nested?;
    flag: Bool = false;

    init() {
        self.flag = true;
        self.data = Nested{subfield1: 1, subfield2: true};
    }
}