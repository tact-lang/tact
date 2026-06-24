struct BigNested {
    s1: Int;
    s2: Bool;
    s3: String;
    s4: Address;
    s5: Cell;
    s6: String?;
}

contract ManyTypes {
    val: BigNested;

    init() {
        self.val = BigNested{
            s1: 1,
            s2: true,
            s3: "hi",
            s4: myAddress(),
            s5: emptyCell(),
            s6: null
        };
    }
}