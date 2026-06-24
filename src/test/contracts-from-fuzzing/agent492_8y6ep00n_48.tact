struct Line {
    start: Int;
    end: Int;
}

contract C {
    l1: Line;
    l2: Line;

    init() {
        self.l1 = Line{start:0,end:1};
        self.l2 = Line{start:2,end:3};
    }
}