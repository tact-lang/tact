struct BigTuple {
    first: Int;
    second: Bool;
    third: Int;
    fourth: Bool;
    fifth: Int;
}

contract MixedFields {
    data: BigTuple;

    init() {
        self.data = BigTuple{
            first: 1,
            second: true,
            third: 3,
            fourth: false,
            fifth: 5,
        };
    }
}