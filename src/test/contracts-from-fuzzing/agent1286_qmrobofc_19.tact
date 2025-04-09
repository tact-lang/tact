struct HasStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract ManyStrings {
    val: HasStrings;

    init() {
        self.val = HasStrings{
            a: "a", b: "b", c: "c", d: "d"
        };
    }
}