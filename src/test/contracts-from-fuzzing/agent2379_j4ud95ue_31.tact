struct Triple {
    first: String;
    second: String?;
    third: String;
}

contract Test {
    data: Triple;

    init() {
        self.data = Triple{
            first: "a",
            second: null,
            third: "c",
        };
    }
}