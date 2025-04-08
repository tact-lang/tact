// intentional contract with nested empty struct (known unsupported)
// testing struct with 1 big deeply nested optional branch

struct Leaf {
    v: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract OptTree {
    data: Branch;

    init() {
        self.data = Branch{
            left: Leaf{ v: null },
            right: null,
        };
    }
}
