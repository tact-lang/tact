// Contract param with nested optional struct param
struct InnerOpt {
    a: Int;
    b: String;
}
contract ParamOptNested(
    innerOpt: InnerOpt?,
    note: String,
) {}