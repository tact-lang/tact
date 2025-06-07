struct Leaf { val: Int }
struct Mid {
    leafOpt: Leaf?;
}
struct Root {
    mid: Mid;
    flag: Bool;
}

contract OptionalLeafInNested {
    state: Root;

    init() {
        self.state = Root{mid: Mid{leafOpt:null}, flag:true};
    }
}