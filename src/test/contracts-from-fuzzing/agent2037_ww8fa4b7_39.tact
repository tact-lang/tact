struct ParInner {
    x: Int? = null;
    y: String = "d";
}

contract ParamWithNestedOpt(
    data: ParInner?,
) {
}
