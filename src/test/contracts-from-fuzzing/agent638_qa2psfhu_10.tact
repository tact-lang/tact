struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf;
    note: String?;
}

contract AssignLater {
    data: Mid? = null;

    receive() {
        self.data = Mid{
            leaf: Leaf{ val: 100 },
            note: "now set"
        };
    }
}