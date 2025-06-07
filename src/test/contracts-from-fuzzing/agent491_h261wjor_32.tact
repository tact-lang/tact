// Nested struct inside optional
struct Sub { val: Int; }

contract OptionalStructField {
    opt: Sub?;
    init() {
        self.opt = Sub{ val: 42 };
    }
}