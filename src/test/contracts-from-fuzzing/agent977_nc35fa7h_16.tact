// optional struct with optional fields in param syntax
struct OptRec {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ParOptOpt(
    rec: OptRec?,
    num: Int
) {
}