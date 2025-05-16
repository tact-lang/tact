contract ManyOptionals {
    one: Int?;
    two: Int?;
    three: Int?;
    four: Int?;
    five: Int?;
    six: Int?;
    seven: Int?;
    eight: Int?;
    nine: Int?;
    ten: Int?;

    receive() {
        let _ = self.five;
    }
}