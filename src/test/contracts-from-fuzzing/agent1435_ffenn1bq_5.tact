struct DeepInner { val: Int }

struct Middle { val: DeepInner? }

contract OptNested {
    data: Middle;

    init() {
        self.data = Middle{
            val: null
        };
    }
}