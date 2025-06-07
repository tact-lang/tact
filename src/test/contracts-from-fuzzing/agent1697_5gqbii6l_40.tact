struct UnicodeStruct {
    text: String = "unic🦄de☂️test";
}

contract TestContract {
    s: UnicodeStruct;

    init() {
        self.s = UnicodeStruct{};
    }
}