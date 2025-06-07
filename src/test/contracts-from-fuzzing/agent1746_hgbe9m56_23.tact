// optional nested structs with nulls
struct SubData {
    a: Int;
    b: Bool;
}

struct Wrapper {
    sub: SubData?;
    val: Int;
}

contract OptionalStructs {
    w: Wrapper;
    
    init() {
        self.w = Wrapper{
            sub: null,
            val: 7
        };
    }
}
