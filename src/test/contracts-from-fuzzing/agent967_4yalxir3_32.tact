struct OnlyString {
    s: String;
}

contract JustAStringStruct {
    k: OnlyString;

    init() {
        self.k = OnlyString{s: "Hello"};
    }
}