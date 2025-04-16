// Optional struct containing an optional struct, field declared with default null
struct SOpt {
    a: Int?;
}

struct TOpt {
    s: SOpt?;
}

contract DefaultOptTest {
    field: TOpt = TOpt{ s: null };
}
