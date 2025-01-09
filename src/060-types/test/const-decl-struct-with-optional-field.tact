primitive Int;
trait BaseTrait { }

struct S { s: Int? }
const x: Int = S {}.s == null ? 42 : 0;
