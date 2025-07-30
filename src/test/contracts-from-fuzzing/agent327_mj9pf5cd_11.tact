struct InnerOpt {
    q: Int;
}

contract UnassignedNestedOpt {
    s: InnerOpt?;

    init() {
        // left unset
    }
}