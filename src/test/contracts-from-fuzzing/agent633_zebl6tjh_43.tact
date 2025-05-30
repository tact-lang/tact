contract MixTypes {
    i: Int = 3;
    b: Bool = false;
    s: String = "hello";
    a: Address;

    init() {
        self.a = myAddress();
    }
}