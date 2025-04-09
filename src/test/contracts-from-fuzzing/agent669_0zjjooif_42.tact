struct IntsAndStrings {
    x: Int; y: Int;
    a: String; b: String;
}

contract MixedFields {
    data: IntsAndStrings;

    init() {
        self.data = IntsAndStrings{ x:1,y:2,a:"hi",b:"bye" };
    }
}