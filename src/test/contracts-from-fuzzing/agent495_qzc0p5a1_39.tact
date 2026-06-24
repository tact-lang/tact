// struct containing booleans and strings
struct BoolString {
    flag: Bool;
    text: String;
}

contract BS {
    store: BoolString;
    init() {
        self.store = BoolString{ flag: true, text: "x" };
    }
}