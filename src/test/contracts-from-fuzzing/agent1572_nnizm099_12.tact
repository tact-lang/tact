// Deeply nested optionals for inner struct fields
struct InnerDeepOptional {
    s: String?;
    b: Bool?;
    i: Int?;
}

struct NestedDeepOptional {
    inner1: InnerDeepOptional?;
    inner2: InnerDeepOptional?;
    done: Bool;
}

contract DeepOptionals {
    val: NestedDeepOptional = NestedDeepOptional{
        inner1: null,
        inner2: null,
        done: false
    };

    init() {
        self.val = NestedDeepOptional{
            inner1: InnerDeepOptional{s:null, b:true, i:1},
            inner2: null,
            done: true
        };
    }
}