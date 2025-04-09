// optional struct field with inner optionals
struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract OptStructInContract {
    opt: InnerOpt? = null;
}