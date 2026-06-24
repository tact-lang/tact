struct LargeStrings {
    a:String; b:String; c:String; d:String; e:String; f:String;
}

contract LongStrs {
    data: LargeStrings;

    init() {
        self.data = LargeStrings{ a:"a", b:"b", c:"c", d:"d", e:"e", f:"f" };
    }
}