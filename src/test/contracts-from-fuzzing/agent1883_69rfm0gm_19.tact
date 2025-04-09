struct InnerMost { val: Int; }

struct InnerOpt { content: InnerMost?; }

contract NestedOpts {
    storage: InnerOpt? = InnerOpt{content: null};
}