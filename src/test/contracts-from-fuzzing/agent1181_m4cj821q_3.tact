struct Sample {
    n: Int;
    o: Bool?;
    s: String?;
}

contract TestContract {
    data: Sample;

    init() {
        self.data = Sample{
            n: 7,
            o: null,
            s: "zzz"
        };
    }
}