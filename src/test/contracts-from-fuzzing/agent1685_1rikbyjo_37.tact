struct OptLevel1 {
    i: Int?;
}

struct OptLevel2 {
    lvl1: OptLevel1?;
}

contract DblOptTest {
    layer: OptLevel2;

    init() {
        self.layer = OptLevel2{
            lvl1: null
        };
    }
}
