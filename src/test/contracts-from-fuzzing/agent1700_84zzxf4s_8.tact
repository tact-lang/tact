contract LargeStringFields {
    long1: String = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    long2: String = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
    long3: String = "cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc";
    long4: String = "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd";
    long5: String = "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";

    init() {
        self.long1 = "1";
        self.long2 = "2";
        self.long3 = "3";
        self.long4 = "4";
        self.long5 = "5";
    }
}
