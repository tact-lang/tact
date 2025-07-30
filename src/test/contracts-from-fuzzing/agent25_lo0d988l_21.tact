// Struct containing a nested struct with only optional fields
struct InnerNullable {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Outer {
    inner: InnerNullable;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner: InnerNullable{
                x: null,
                y: null,
                z: null,
            },
        };
    }
}