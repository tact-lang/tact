struct Leaf { value: Int; }

struct MidOpt { child: Leaf?; }

struct TopOpt {
    inner: MidOpt?;
}

contract NestedOptionStructs {
    massive: TopOpt;

    init() {
        self.massive = TopOpt{
            inner: null
        };
    }
}