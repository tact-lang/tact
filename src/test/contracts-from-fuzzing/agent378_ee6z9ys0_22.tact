struct UnicodeStringHolder {
    text: String;
}

contract TestContract {
    field: UnicodeStringHolder;
    
    init() {
        self.field = UnicodeStringHolder { text: "Привет 🌍" };
    }
}