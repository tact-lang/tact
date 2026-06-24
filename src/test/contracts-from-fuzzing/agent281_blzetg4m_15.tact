// Struct with nested optional booleans and integers
struct NestedOptionals {
    foo: Int?;
    bar: Bool?;
    inner: InnerOpt;
}

struct InnerOpt {
    val: Int?;
    flag: Bool?;
}

contract NestedOptsStorage {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals {
            foo: null,
            bar: null,
            inner: InnerOpt{ val: null, flag: null }
        };
    }
}