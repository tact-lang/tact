struct DeepInner { x: Int? = null; }
struct MiddleOpt { di: DeepInner? = null; }
struct TopOpt { m: MiddleOpt? = null; }

contract NestParams(
    t: TopOpt?,
) {}