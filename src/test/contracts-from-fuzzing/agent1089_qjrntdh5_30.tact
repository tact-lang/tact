struct Inner { x: Int = 1; }

struct OuterOpt {
    i: Inner?;
}

contract StructOptStruct {
    o: OuterOpt = OuterOpt{};
}