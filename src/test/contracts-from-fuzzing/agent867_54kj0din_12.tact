// deeply nested optionals and flat optionals with default nulls combined
struct InnerMost {
    val: Int?;
}
struct MiddleOpt {
    val: InnerMost?;
}
struct DeepOptional {
    val: MiddleOpt?;
}
contract TestContract {
    deep: DeepOptional = DeepOptional{ val: null };
    flat1: Int? = null;
    flat2: Bool? = null;
    flat3: String? = null;

    init() {
        self.deep = DeepOptional{
            val: MiddleOpt{
                val: InnerMost{
                    val: 777
                }
            }
        };
        self.flat1 = 11;
        self.flat2 = true;
        self.flat3 = "ok";
    }
}
