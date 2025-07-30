// persistent contract parameter as optional struct
struct InnerOpt {
    val: Int;
}
contract Test(
    data: InnerOpt?
) {}