struct BigNest1 {
    bigInner: BigNest2;
}

struct BigNest2 {
    bigInner2: BigNest3;
}

struct BigNest3 {
    bigInner3: BigNest4;
}

struct BigNest4 {
    bigLeaf: Int;
}

contract MultiLayerDeepNest {
    data: BigNest1;

    init() {
        self.data = BigNest1 {
            bigInner: BigNest2 {
                bigInner2: BigNest3 {
                    bigInner3: BigNest4 {
                        bigLeaf: 999
                    }
                }
            }
        };
    }
}