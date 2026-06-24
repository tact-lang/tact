struct HasBoolIntString {
    a: Bool;
    b: Int;
    c: String;
}

contract MixTypes {
    val: HasBoolIntString;
    init() {
        self.val = HasBoolIntString{
            a:true,
            b:100,
            c:"hi"
        };
    }
}