struct Arranged {
    first: Int;
    second: Bool;
    third: Address;
    fourth: String;
    fifth: Int?;
    sixth: Bool?;
}

contract TestContract {
    a: Arranged;

    init() {
        self.a = Arranged{
            first: 1,
            second: false,
            third: myAddress(),
            fourth: "x",
            fifth: null,
            sixth: null,
        };
    }
}