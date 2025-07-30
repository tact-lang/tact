// deeply nested optional struct, optional at top
struct Leaf {
  leafVal: Int;
}

struct Branch {
  leaf: Leaf?;
  comment: String;
}

contract OptChain {
    field: Branch = Branch {
        leaf: null,
        comment: ""
    };
}
