// deeply nested struct inside optional field of struct which is optional in contract
struct DeepInner { v: Int = 42; }
struct Mid {
    deep: DeepInner = DeepInner{};
}

struct MaybeMid {
    content: Mid?;
}

contract TestContract {
    val: MaybeMid?;

    init() {
        self.val = MaybeMid{content: Mid{deep: DeepInner{v:123}}};
    }

    receive() {
        let _ = self.val;
    }
}