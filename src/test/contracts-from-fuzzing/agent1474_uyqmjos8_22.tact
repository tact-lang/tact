// optional of another struct with all null defaults
struct NullStruct {
    x: Int? = null;
    s: String? = null;
}

struct Container {
    inner: NullStruct?;
}

contract Test21 {
    cnt: Container;
    init() {
        self.cnt = Container{
            inner: null
        };
    }
}