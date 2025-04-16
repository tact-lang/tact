struct Triple {
    first: Int;
    second: Bool;
    third: String;
}

contract OrderMatters {
    a: Int;
    trip: Triple;
    b: Bool;

    init() {
        self.a = 1;
        self.trip = Triple{
            first: 1,
            second: true,
            third: "hi",
        };
        self.b = false;
    }
}