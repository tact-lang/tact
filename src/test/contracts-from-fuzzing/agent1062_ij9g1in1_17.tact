struct Point {
    x: Int;
    y: Int;
}

struct WithStrings {
    first: String;
    second: String;
    third: String;
    pt: Point;
}

contract StringFields {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            first: "one",
            second: "two",
            third: "three",
            pt: Point{x:10,y:20}
        };
    }
}