struct DeepNest { value: Int; inner: InnerStruct; }

struct InnerStruct { flag: Bool; nested: Innermost; }

struct Innermost { note: String; }

contract Test {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            value: 42,
            inner: InnerStruct{
                flag: true,
                nested: Innermost{ note: "hi" }
            }
        };
    }
}