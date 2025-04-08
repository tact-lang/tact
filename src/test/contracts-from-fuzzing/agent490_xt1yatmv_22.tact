// deeply nested struct as contract param
struct Level1 { a:Int; }
struct Level2 { b:Level1; }
struct Level3 { c:Level2; }

contract NestedParam(
    data: Level3
) {}