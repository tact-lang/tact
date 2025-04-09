struct Rec {
    count: Int;
    sum: Int;
    avg: Int?;
    tag: String;
}

contract Test15 {
    x: Rec;
    y: Rec;

    init() {
        self.x = Rec{ count:1, sum:10, avg:null, tag:"x" };
        self.y = Rec{ count:2, sum:20, avg:20, tag:"y" };
    }
}
