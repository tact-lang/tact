struct OneField {
    f: Int;
}

contract SingleStructField {
    sf: OneField;

    init() {
        self.sf = OneField{ f:99 };
    }
}