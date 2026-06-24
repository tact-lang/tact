contract NestedParamContract(
    rec: RecType,
    optRec: RecType?,
) {}

struct RecType {
    x: Int;
    y: Bool;
    z: String;
}