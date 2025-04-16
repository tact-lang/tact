struct Bottom { z: Int; }
struct Middle { b: Bottom; }
struct Top { m: Middle; }

contract Test {
    topField: Top;

    init() {
        self.topField = Top{m: Middle{b: Bottom{z: 10}}};
    }
}