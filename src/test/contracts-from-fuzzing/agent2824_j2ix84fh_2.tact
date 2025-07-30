struct DeepInner { x: Int; y: Bool }

struct Middle { val: DeepInner? }

contract DeepOptionalStruct {
    nested: Middle?;

    init() {
        self.nested = null;
    }
}