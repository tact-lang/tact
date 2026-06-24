struct Leaf {
    data: Int;
}

struct Midlevel {
    left: Leaf;
    right: Leaf;
}

struct Top {
    first: Midlevel;
    second: Midlevel;
    third: Midlevel;
}

contract BigTree {
    root: Top;

    init() {
        self.root = Top{
            first: Midlevel{left:Leaf{data:1}, right:Leaf{data:2}},
            second: Midlevel{left:Leaf{data:3}, right:Leaf{data:4}},
            third: Midlevel{left:Leaf{data:5}, right:Leaf{data:6}}
        };
    }
}
