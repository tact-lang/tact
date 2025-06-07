struct Sub {
    x: Int?;
    y: Int?;
    z: Int?;
}

struct Mid {
    p: Sub;
    q: Sub;
}

contract NestedOptionalsContract {
    nest: Mid;

    init() {
        self.nest = Mid{
            p: Sub{x:null,y:2,z:null},
            q: Sub{x:3,y:null,z:4}
        };
    }

    receive() {
        let _ = (self.nest.q.z != null ? self.nest.q.z!! : 0) + 1;
    }
}