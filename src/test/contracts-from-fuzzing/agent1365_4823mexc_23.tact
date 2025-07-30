struct BigStringStruct {
    long1: String; long2: String; long3: String; long4: String; long5: String;
    long6: String; long7: String; long8: String; long9: String; long10: String;
}

contract BigStringVars {
    s: BigStringStruct;

    init() {
        self.s = BigStringStruct{
            long1: "1",
            long2: "22",
            long3: "333",
            long4: "4444",
            long5: "55555",
            long6: "666666",
            long7: "7777777",
            long8: "88888888",
            long9: "999999999",
            long10: "1010101010",
        };
    }
}