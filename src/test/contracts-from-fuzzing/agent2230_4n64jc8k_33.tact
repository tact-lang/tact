// optional contract parameter struct with optional fields
struct CP {
    a: Int?;
    b: String?;
}

contract ParamStructOpt(
    param: CP?
) {}
