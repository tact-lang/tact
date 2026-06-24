struct Info {
    x: Int;
    y: Int;
    label: String;
}

contract ParamContract(
    foo: Int,
    opt: Bool?,
    nested: Info,
    maybeInfo: Info?,
) {}