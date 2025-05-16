// Overriding default values of nested struct fields with optionals
struct InnerOptional {
    val: Int?;
}

struct Holder {
    inner: InnerOptional;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            inner: InnerOptional{
                val: null
            }
        };
    }
}