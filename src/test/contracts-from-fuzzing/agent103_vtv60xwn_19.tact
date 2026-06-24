struct RecDepth3 {
    d3i: Int;
}

struct RecDepth2 {
    d3: RecDepth3;
    d2s: String;
}

struct RecDepth1 {
    d2: RecDepth2;
    d1b: Bool;
}

contract Recurser {
    root: RecDepth1;

    init() {
        self.root = RecDepth1{
            d2: RecDepth2{
                d3: RecDepth3{ d3i: 99 },
                d2s: "hi"
            },
            d1b: false
        };
    }
}