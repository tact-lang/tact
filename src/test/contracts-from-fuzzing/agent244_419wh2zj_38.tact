// Deep large nested structure with optional fields at every level and deep default values
struct Leaf {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Branch {
    leaf: Leaf?;
    note: String = "leafnote";
}

struct Trunk {
    branch: Branch?;
    flag: Bool = true;
}

contract LargeDeepMix {
    data: Trunk;

    init() {
        self.data = Trunk{
            branch: null
        };
    }
}