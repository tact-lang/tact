struct ChildS {
    val: Int;
}

struct ParentS {
    child: ChildS?; // defaults to null
}

contract OptNullInit {
    s: ParentS;

    init() {
        self.s = ParentS{
            child: null
        };
    }
}