struct Leaf {
    x: Int;
    y: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    main: Branch;
    backup: Branch;
}

contract TreeContract {
    root: Root;

    init() {
        self.root = Root{
            main: Branch{ left:null, right:null },
            backup: Branch{ left:null, right:null }
        };
    }
}