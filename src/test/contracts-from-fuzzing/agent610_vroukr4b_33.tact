struct Leaf {
    a: Int = 42;
    b: Bool?;          // implicit null default
}

struct Branch {
    leaf: Leaf;
    optionalLeaf: Leaf?;  // implicit null
}

contract OptionalDefaults {
    branch: Branch?;     // implicit null

    // no init() needed due to defaults
}