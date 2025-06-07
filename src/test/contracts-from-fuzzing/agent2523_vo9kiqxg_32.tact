// test contract param style big optional struct
struct BigOptional {
    a:Int?; b:Int?; c:Int?; d:Int?; e:Int?; f:Int?; g:String?;
}
contract ParamOpt(
    foo: BigOptional,
) {}
