// optional struct inside contract param with optional primitive inside struct
struct Mixed {
    a: Int?;
    b: Bool?;
}

contract ParamDeepOpt(
    m: Mixed?,
) {}