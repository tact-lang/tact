struct MessageWrap {
    header: Int;
    payload: String;
}

struct Tree {
    left: MessageWrap;
    right: MessageWrap;
}

contract TreeLikeContract {
    t: Tree;

    init() {
        self.t = Tree{
            left: MessageWrap{ header: 1, payload: "L" },
            right: MessageWrap{ header: 2, payload: "R" },
        };
    }
}
