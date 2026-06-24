struct Point { x: Int; y: Int; }

struct MaybePoint { point: Point?; }

contract NestedOptStruct {
    pos: MaybePoint = MaybePoint{ point: null };
}