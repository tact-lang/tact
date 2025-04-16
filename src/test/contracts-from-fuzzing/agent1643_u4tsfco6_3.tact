struct Sample {
    first: Int;
    second: Bool;
    third: Int?;
    fourth: Bool?;
    fifth: String;
    sixth: String?;
}

contract TestStorage {
    sample: Sample;

    init() {
        self.sample = Sample{
            first: 1,
            second: true,
            third: null,
            fourth: null,
            fifth: "abc",
            sixth: null,
        };
    }
}