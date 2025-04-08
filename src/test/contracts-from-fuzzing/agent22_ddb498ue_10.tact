contract TestContract {
    first: Int = 10;
    second: Bool = false;
    third: String = "abc";
    fourth: Int?;
    fifth: Bool?;
    sixth: String?;

    init() {
        self.fourth = null;
        self.fifth = true;
        self.sixth = null;
    }
}
