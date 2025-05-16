struct OptRefs {
    s: String? = null;
    c: Cell? = null;
    sl: Slice? = null;
}

contract RefParam(
    refs: OptRefs
) {}