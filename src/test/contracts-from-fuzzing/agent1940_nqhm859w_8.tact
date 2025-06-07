struct Stringy {
    text1: String;
    text2: String?;
    text3: String;
}

contract StringsInStorage {
    s: Stringy;

    init() {
        self.s = Stringy{ text1:"Hello", text2:null, text3:"World"};
    }
}