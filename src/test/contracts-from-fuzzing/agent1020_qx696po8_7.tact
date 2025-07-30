struct RecursiveLayer1 {
    next: RecursiveLayer2;
    flag1: Bool;
}

struct RecursiveLayer2 {
    next: RecursiveLayer3;
    flag2: Bool;
}

struct RecursiveLayer3 {
    val: Int;
    flag3: Bool;
}

contract MultiLayerDeep {
    rec: RecursiveLayer1;

    init() {
        self.rec = RecursiveLayer1{
            next: RecursiveLayer2{
                next: RecursiveLayer3{ val: 7, flag3: true },
                flag2: false
            },
            flag1: true
        };
    }
}