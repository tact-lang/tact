struct Metrics {
    score: Int as uint8;
    rank: Int as uint16;
}

struct Record {
    name: String;
    metrics: Metrics;
}

contract TestContract {
    record: Record;

    init() {
        self.record = Record{
            name: "fuzz",
            metrics: Metrics{ score: 255, rank: 65535 }
        };
    }

    receive() {}
}