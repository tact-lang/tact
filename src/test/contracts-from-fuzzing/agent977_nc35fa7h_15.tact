// nested struct inside optional contract param
struct Rec {
    a: Int;
    b: String;
}

contract ParOptNested(
    rec: Rec?,
    num: Int
) {
}