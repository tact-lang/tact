// contract parameter passing optional nested struct
struct NestOpt {
    val: Int?;
}

contract ParamOpt(
    nest: NestOpt?,
    count: Int
) {}