struct Sin {
 a: Int = 1;
 b: String? = null;
}

struct Sout {
 c: Sin;
 d: Bool = true;
}

contract NestedDefaults {
 state: Sout = Sout{ c: Sin{}, d: true };
}