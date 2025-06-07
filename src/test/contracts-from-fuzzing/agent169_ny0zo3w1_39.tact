struct Leaf {
    x: Int? as uint16;
    y: Bool?;    
}

struct Branch {
    l: Leaf?;
    note: String?;
}

contract TestContract {
    b: Branch? = null;

    init() {
        self.b = Branch{
            l: Leaf{ x: 42, y: null },
            note: null
        };
    }
}