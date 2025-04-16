struct Deep {
    x: Int? = null;
    y: Int? = 7;
}
struct High {
    a: Int? = null;
    b: Deep;
}

contract Fuzz43 {
    nest: High;

    init() {
        self.nest = High{ b: Deep{} };
    }
}