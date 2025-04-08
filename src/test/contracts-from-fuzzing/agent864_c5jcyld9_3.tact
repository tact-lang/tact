struct Inner {
    n: Int?;
    flag: Bool?;
    note: String?;
}

contract TestContract {
    complex: Inner;

    init() {
        self.complex = Inner{
            n: null,
            flag: true,
            note: "note"
        };
    }
}